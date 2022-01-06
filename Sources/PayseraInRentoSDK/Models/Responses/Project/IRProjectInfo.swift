public struct IRProjectInfo: Decodable {
    public let project: IRProject
    public let photoURLs: [String]
    public let documentURLs: [String]
    public let descriptionHTML: String
    public let specialTermAndConditionsHTML: String?
    public let riskScoring: [IRRiskScoring]
    public let occupancy: [IROccupancy]
    public let generalLoanTermsURL: String
    public let specialLoanTermsURL: String
    
    private enum CodingKeys: String, CodingKey {
        case project = "project_short"
        case photoURLs = "photos"
        case documentURLs = "documents"
        case descriptionHTML = "description"
        case specialTermAndConditionsHTML = "special_term_and_conditions"
        case riskScoring = "risk_scoring"
        case occupancy
        case generalLoanTermsURL = "general_loan_terms"
        case specialLoanTermsURL = "special_loan_terms"
    }
}
