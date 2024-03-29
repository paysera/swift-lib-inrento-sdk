import Alamofire
import Foundation

enum Router {
    /// Base URL
    static var baseURL: URL {
        switch InRentoTargetEnvironment.current {
        case .test:
            return URL(string: "https://test-api.inrento.com/paysera/v1")!
        case .prod:
            return URL(string: "https://api.inrento.com/paysera/v1")!
        }
    }
    
    /// GET
    case getAccount
    case getPortfolio
    case getTransactions
    case getProjects
    case getProject(id: Int)
    case getProjectStats(id: Int)
    case getDocument(id: String)
    case getProjectUpdates(id: String)
    case calculateInvestmentEarnings((id: Int, amount: String))
    
    /// POST
    case invest(request: IRInvestRequest)
    case confirmRiskAgreement
    case saveQuestionnaireAnswers(IRSaveQuestionAnswersRequest)
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
        case .calculateInvestmentEarnings((let id, let amount)):
            return RequestRoute(method: .get, path: "project/\(id)/\(amount)")
        
        // MARK: POST
        case .invest(let payload):
            return RequestRoute(method: .post, path: "invest", payload: payload)
        case .confirmRiskAgreement:
            return RequestRoute(method: .post, path: "risk_agreement")
        case .saveQuestionnaireAnswers(let request):
            return RequestRoute(
                method: .post,
                path: "questionnaire",
                parameters: request.toJSON()
            )
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
