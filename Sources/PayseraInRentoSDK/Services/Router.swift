import Alamofire
import Foundation

enum Router {
    // MARK: BASEURL
    private static let baseURL = URL(string: "https://test-api.inrento.com/paysera/v1")!
    
    // MARK: GET
    case getAccount
    case getPortfolio
    case getTransactions
    case getProjects
    case getProject(id: Int)
    case getProjectStats(id: Int)
    case getDocument(id: String)
    case getProjectUpdates(id: String)
    
    // MARK: POST
    case invest(request: IRInvestRequest)
    case confirmRiskAgreement
}

private extension Router {
    var route: RequestRoute {
        switch self {
        // MARK: GET
        case .getAccount:
            return RequestRoute(method: .get, path: "account")
        case .getPortfolio:
            return RequestRoute(method: .get, path: "portfolio")
        case .getTransactions:
            return RequestRoute(method: .get, path: "transactions")
        case .getProjects:
            return RequestRoute(method: .get, path: "projects")
        case .getProject(let id):
            return RequestRoute(method: .get, path: "project/\(id)")
        case .getProjectStats(let id):
            return RequestRoute(method: .get, path: "project/\(id)/stats")
        case .getDocument(let id):
            return RequestRoute(method: .get, path: "document/\(id)")
        case .getProjectUpdates(let id):
            return RequestRoute(method: .get, path: "project/\(id)/updates")
        
        // MARK: POST
        case .invest(let payload):
            return RequestRoute(method: .post, path: "invest", payload: payload)
        case .confirmRiskAgreement:
            return RequestRoute(method: .post, path: "risk_agreement")
        }
    }
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let info = route
        let url = Self.baseURL.appendingPathComponent(info.path)
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
    let method: HTTPMethod
    let path: String
    let parameters: Parameters?
    
    private static let encoder = JSONEncoder()
    
    init(
        method: HTTPMethod,
        path: String,
        parameters: Parameters? = nil
    ) {
        self.method = method
        self.path = path
        self.parameters = parameters
    }
    
    init<Payload: Encodable>(
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
        
        self.init(method: method, path: path, parameters: dictionary)
    }
}
