import Alamofire
import Foundation

enum BaseURLType {
    case inRento
    case wallet
}

enum Router {
    // MARK: BASEURL
    private var baseURL: URL {
        URL(string: "https://test-api.inrento.com/paysera/v1")!
    }
    private var walletBaseURL: URL {
        URL(string: "https://wallet.paysera.com/partner-oauth/v1")!
    }
    
    // MARK: GET
    case getAccount
    case getPortfolio
    case getTransactions
    case getProjects
    case getProject(id: Int)
    case getProjectStats(id: Int)
    case getDocument(id: String)
    case getProjectUpdates(id: String)
    case getPartnerOAuthRequests
    case getPartnerOAuthRequestsApprove(key: String)
    
    // MARK: POST
    case invest(request: IRInvestRequest)
    case confirmRiskAgreement
}

private extension Router {
    var route: RequestRoute {
        switch self {
        // MARK: GET
        case .getAccount:
            return RequestRoute(baseURL: baseURL, method: .get, path: "account")
        case .getPortfolio:
            return RequestRoute(baseURL: baseURL, method: .get, path: "portfolio")
        case .getTransactions:
            return RequestRoute(baseURL: baseURL, method: .get, path: "transactions")
        case .getProjects:
            return RequestRoute(baseURL: baseURL, method: .get, path: "projects")
        case .getProject(let id):
            return RequestRoute(baseURL: baseURL, method: .get, path: "project/\(id)")
        case .getProjectStats(let id):
            return RequestRoute(baseURL: baseURL, method: .get, path: "project/\(id)/stats")
        case .getDocument(let id):
            return RequestRoute(baseURL: baseURL, method: .get, path: "document/\(id)")
        case .getProjectUpdates(let id):
            return RequestRoute(baseURL: baseURL, method: .get, path: "project/\(id)/updates")
        case .getPartnerOAuthRequests:
            return RequestRoute(baseURL: walletBaseURL, method: .get, path: "partner-oauth-requests")
        case .getPartnerOAuthRequestsApprove(let key):
            return RequestRoute(baseURL: walletBaseURL, method: .get, path: "partner-oauth-requests/\(key)/approve")
            
        // MARK: POST
        case .invest(let payload):
            return RequestRoute(baseURL: baseURL, method: .post, path: "invest", payload: payload)
        case .confirmRiskAgreement:
            return RequestRoute(baseURL: baseURL, method: .post, path: "risk_agreement")
        }
    }
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let info = route
        let url = info.baseURL.appendingPathComponent(info.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.method = info.method
        
        switch info.method {
        case .put, .post:
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: info.parameters)
        default:
            urlRequest = try URLEncoding.default.encode(urlRequest, with: info.parameters)
        }
        return urlRequest
    }
}

private struct RequestRoute {
    let baseURL: URL
    let method: HTTPMethod
    let path: String
    let parameters: Parameters?
    
    private static let encoder = JSONEncoder()
    
    init(
        baseURL: URL,
        method: HTTPMethod,
        path: String,
        parameters: Parameters? = nil
    ) {
        self.baseURL = baseURL
        self.method = method
        self.path = path
        self.parameters = parameters
    }
    
    init<Payload: Encodable>(
        baseURL: URL,
        method: HTTPMethod,
        path: String,
        payload: Payload?
    ) {
        var dictionary: Parameters? = nil
        if
            let data = try? Self.encoder.encode(payload),
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
            let jsonDictionary = jsonObject as? [String: Any]
        {
            dictionary = jsonDictionary
        }
        
        self.init(baseURL: baseURL, method: method, path: path, parameters: dictionary)
    }
}
