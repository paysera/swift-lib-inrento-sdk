import Foundation

public struct IRProjectInfo: Decodable {
    public let project: IRProject
    public let photoURLs: [URL]
    public let documentIDs: [Int]
    public let descriptionHTML: String
    public let riskScoring: [IRRiskScoring]
    public let occupancy: [IROccupancy]
    public let generalLoanTermsDocumentID: Int?
    public let specialLoanTermsDocumentID: Int?
    
    private enum CodingKeys: String, CodingKey {
        case project = "project_short"
        case photoURLs = "photos"
        case documentIDs = "documents"
        case descriptionHTML = "description"
        case riskScoring = "risk_scoring"
        case occupancy
        case generalLoanTermsDocumentID = "general_loan_terms"
        case specialLoanTermsDocumentID = "special_loan_terms"
    }
}
