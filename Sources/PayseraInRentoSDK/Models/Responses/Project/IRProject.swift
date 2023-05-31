import Foundation

public struct IRProject: Decodable {
    public let id: Int
    public let name: String
    public let status: IRProjectStatus
    public let country: String?
    public let city: String?
    public let address: String?
    public let currency: String
    public let fundingAmount: String
    public let collectedFunds: String
    public let investorsCount: Int
    public let annualYield: String
    public let additionalAnnualYield: String?
    public let yieldName: String
    public let yieldValue: String
    public let termInMonths: Int
    public let term: String?
    public let realReturn: String?
    public let realTerm: String?
    public let endInvestmentsDate: Date
    public let investmentType: Int?
    public let investmentTypeName: String?
    public let propertyType: Int?
    public let propertyTypeName: String?
    public let mortgageRank: Int?
    public let mortgageRankName: String?
    public let mainPhotoURL: URL?
    public let riskScoringValue: String?
    public let interestDistribution: String?
    public let description: String
    public let capitalGains: IRCapitalGains?
    public let latitude: Double?
    public let longitude: Double?
    public let updates: [IRProjectUpdate]
    public let documents: [IRProjectDocument]
    public let reasonsToInvest: [String?]
    public let financialTerms: String?
    public let projectOwner: IRProjectOwner?
    public let keyInvestmentRisks: [IRKeyInvestmentRisk?]
    public let faq: [IRFAQ?]

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case country
        case city
        case address
        case currency
        case fundingAmount = "funding_amount"
        case collectedFunds = "collected_funds"
        case investorsCount = "investors_count"
        case annualYield = "annual_yield"
        case additionalAnnualYield = "additional_annual_yield"
        case yieldName = "yield_param1_name"
        case yieldValue = "yield_param1_value"
        case termInMonths = "term"
        case term = "term_display"
        case realReturn = "real_return"
        case realTerm = "real_term"
        case endInvestmentsDate = "date_end_investments"
        case investmentType = "investment_type"
        case investmentTypeName = "investment_type_name"
        case propertyType = "property_type"
        case propertyTypeName = "property_type_name"
        case mortgageRank = "mortgage_rank"
        case mortgageRankName = "mortgage_rank_name"
        case mainPhotoURL = "photo"
        case riskScoringValue = "risk_scoring_value"
        case interestDistribution = "interest_distribution"
        case description
        case capitalGains = "capital_gains"
        case latitude
        case longitude
        case updates
        case documents
        case reasonsToInvest = "reasons_to_invest"
        case financialTerms = "financial_terms"
        case projectOwner = "project_owner"
        case keyInvestmentRisks = "project_key_investment_risks"
        case faq = "project_faq"
    }
}
