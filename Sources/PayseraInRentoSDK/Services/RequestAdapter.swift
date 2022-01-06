import Alamofire
import Foundation

class RequestAdapter: RequestInterceptor {
    private let credentials: InRentoCredentials
    private let headers: InRentoHeaders?
    
    public init(
        credentials: InRentoCredentials,
        headers: InRentoHeaders?
    ) {
        self.credentials = credentials
        self.headers = headers
    }
    
    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void
    ) {
        guard let token = credentials.accessToken else {
            return completion(.failure(InRentoError.authenticationFailed))
        }
        
        var urlRequest = urlRequest
        urlRequest.headers.add(name: "X-AUTH-TOKEN", value: token)
        
        if let headers = headers {
            headers.headers.forEach {
                urlRequest.headers.add(name: $0.name, value: $0.value)
            }
        }

        completion(.success(urlRequest))
    }
    
    public func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {
        completion(.doNotRetry)
    }
}
