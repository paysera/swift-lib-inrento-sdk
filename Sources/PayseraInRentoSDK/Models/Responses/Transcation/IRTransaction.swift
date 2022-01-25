import Foundation

public struct IRTransaction: Decodable {
    public let transactionID: Int
    public let date: Date
    public let type: String
    public let amount: String
    public let smPrice: String?
    public let currency: String
    public let projectName: String?
    public let projectStatus: IRProjectStatus?
    
    private enum CodingKeys: String, CodingKey {
        case transactionID = "transaction_id"
        case date
        case type
        case amount
        case smPrice = "sm_price"
        case currency
        case projectName = "project_name"
        case projectStatus = "project_status"
    }
}
