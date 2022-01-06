public struct IRTransactions: Decodable {
    public let totalTransactions: Int
    public let transactions: [IRTransaction]
    
    private enum CodingKeys: String, CodingKey {
        case totalTransactions = "total_transactions"
        case transactions
    }
}
