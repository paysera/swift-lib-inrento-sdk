import Foundation

public struct IRPortfolioInvestment: Decodable {
    public let investmentID: Int
    public let date: Date
    public let projectID: Int
    public let projectName: String
    public let projectMainPhotoURL: String
    public let currency: String
    public let investedFunds: String
    public let receivedDividends: String
    public let receivedPrincipal: String
    public let outstandingPrincipal: String
    
    private enum CodingKeys: String, CodingKey {
        case investmentID = "investment_id"
        case date
        case projectID = "project_id"
        case projectName = "project_name"
        case projectMainPhotoURL = "project_main_photo_url"
        case currency
        case investedFunds = "invested_funds"
        case receivedDividends = "received_dividends"
        case receivedPrincipal = "received_principal"
        case outstandingPrincipal = "outstanding_principal"
    }
}
