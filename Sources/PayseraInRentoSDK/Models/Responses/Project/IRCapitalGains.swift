import Foundation

public struct IRCapitalGains: Decodable {
    public let inrento: String
    public let borrower: String
    public let investors: String
    
    private enum CodingKeys: String, CodingKey {
        case inrento
        case borrower
        case investors
    }
}

