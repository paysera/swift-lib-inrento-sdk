public struct IRProjectStats: Decodable {
    public let projectStatus: IRProjectStatus
    public let currency: String
    public let collectedFunds: String
    public let investorsCount: Int
    public let userInvestments: String
    public let userOutstandingPrincipal: String
    
    private enum CodingKeys: String, CodingKey {
        case projectStatus = "project_status"
        case currency
        case collectedFunds = "collected_funds"
        case investorsCount = "investors_count"
        case userInvestments = "user_investments"
        case userOutstandingPrincipal = "user_outstanding_principal"
    }
}
