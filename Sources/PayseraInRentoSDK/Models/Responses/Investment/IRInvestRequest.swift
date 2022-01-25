public struct IRInvestRequest: Encodable {
    public let projectID: Int
    public let amount: Int
    
    private enum CodingKeys: String, CodingKey {
        case projectID = "project_id"
        case amount
    }
}
