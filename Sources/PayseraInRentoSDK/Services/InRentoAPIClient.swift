import Alamofire
import Foundation
import PromiseKit

final public class InRentoAPIClient {
    private let session: Session
    private let credentials: InRentoCredentials
    private let tokenRefresher: InRentoTokenRefresherInterface?
    private var requestsQueue = [APIRequest]()
    
    private var refreshPromise: Promise<Void>?
    private let workQueue = DispatchQueue(label: "\(InRentoAPIClient.self)")
    private lazy var decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
        return jsonDecoder
    }()
    
    init(
        session: Session,
        credentials: InRentoCredentials,
        tokenRefresher: InRentoTokenRefresherInterface?
    ) {
        self.session = session
        self.credentials = credentials
        self.tokenRefresher = tokenRefresher
    }
    
    public func cancelAllOperations() {
        session.cancelAllRequests()
    }
    
    func doRequest<RC: URLRequestConvertible, D: Decodable>(requestRouter: RC) -> Promise<D> {
        let request = createRequest(requestRouter)
        executeRequest(request)
        
        return request
            .pendingPromise
            .promise
            .compactMap { $0 }
            .map(on: workQueue) { body in
                try self.decoder.decode(D.self, from: body)
            }
    }
    
    func doRequest<RC: URLRequestConvertible>(requestRouter: RC) -> Promise<Void> {
        let request = createRequest(requestRouter)
        executeRequest(request)
        
        return request
            .pendingPromise
            .promise
            .asVoid()
    }
    
    private func createRequest<RC: URLRequestConvertible>(_ endpoint: RC) -> APIRequest {
        APIRequest(pendingPromise: Promise<Data?>.pending(), requestEndpoint: endpoint)
    }
    
    private func executeRequest(_ apiRequest: APIRequest) {
        workQueue.async {
            guard let urlRequest = apiRequest.requestEndpoint.urlRequest else {
                return apiRequest.pendingPromise.resolver.reject(InRentoError.unknown)
            }
            
            if self.tokenRefresher != nil, self.credentials.hasExpired() {
                self.requestsQueue.append(apiRequest)
                self.refreshToken()
            } else {
                self.session
                    .request(apiRequest.requestEndpoint)
                    .responseData(queue: self.workQueue) { response in
                        self.handleResponse(response, for: apiRequest, with: urlRequest)
                    }
            }
        }
    }
    
    private func handleResponse(
        _ response: AFDataResponse<Data>,
        for apiRequest: APIRequest,
        with urlRequest: URLRequest
    ) {
        guard let urlResponse = response.response else {
            return handleMissingUrlResponse(for: apiRequest, with: response.error)
        }
        
        let statusCode = urlResponse.statusCode
        
        if 200 ... 299 ~= statusCode {
            if
                let response = response.value,
                let error = try? decoder.decode(InRentoError.self, from: response)
            {
                apiRequest.pendingPromise.resolver.reject(error)
            } else {
                apiRequest.pendingPromise.resolver.fulfill(response.value ?? Data())
            }
        } else {
            let error = response.value
                .flatMap { try? decoder.decode(InRentoError.self, from: $0) } ?? .unknown
            
            if statusCode == 401 {
                handleUnauthorizedRequest(apiRequest, error: error)
            } else {
                apiRequest.pendingPromise.resolver.reject(error)
            }
        }
    }
    
    private func handleMissingUrlResponse(
        for apiRequest: APIRequest,
        with afError: AFError?
    ) {
        let error: InRentoError
        
        switch afError {
        case .explicitlyCancelled:
            error = .cancelled
        case .sessionTaskFailed(let e as URLError) where
                e.code == .notConnectedToInternet ||
                e.code == .networkConnectionLost ||
                e.code == .dataNotAllowed:
            error = .noInternet
        default:
            error = .unknown
        }
        
        apiRequest.pendingPromise.resolver.reject(error)
    }
    
    private func handleUnauthorizedRequest(
        _ apiRequest: APIRequest,
        error: InRentoError
    ) {
        guard tokenRefresher != nil else {
            return apiRequest.pendingPromise.resolver.reject(error)
        }
        
        if credentials.hasRecentlyRefreshed() {
            return executeRequest(apiRequest)
        }
        
        requestsQueue.append(apiRequest)
        refreshToken()
    }
    
    private func refreshToken() {
        guard
            refreshPromise == nil,
            let tokenRefresher = tokenRefresher
        else {
            return
        }
        
        refreshPromise = tokenRefresher.refreshToken()
        refreshPromise?
            .done(on: workQueue) {
                self.resumeQueue()
                self.refreshPromise = nil
            }
            .catch(on: workQueue) { error in
                self.cancelQueue(error: error)
                self.refreshPromise = nil
            }
    }
    
    private func resumeQueue() {
        requestsQueue.forEach(executeRequest)
        requestsQueue.removeAll()
    }
    
    private func cancelQueue(error: Error) {
        requestsQueue.forEach { request in
            request.pendingPromise.resolver.reject(error)
        }
        requestsQueue.removeAll()
    }
}
