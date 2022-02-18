public struct IRInvestRequest: Encodable {
    public let projectID: Int
    public let amount: Int
    
    public init(
        projectID: Int,
        amount: Int
    ) {
        self.projectID = projectID
        self.amount = amount
    }
    
    private enum CodingKeys: String, CodingKey {
        case projectID = "project_id"
        case amount
    }
}
