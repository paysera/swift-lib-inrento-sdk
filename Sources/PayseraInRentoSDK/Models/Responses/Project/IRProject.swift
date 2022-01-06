public struct IRProject: Decodable {
    public let id: Int
    public let name: String
    public let status: IRProjectStatus
    public let country: String
    public let city: String
    public let address: String?
    public let currency: String
    public let fundingAmount: String
    public let collectedFunds: String
    public let investorsCount: String
    public let annualYield: String
    public let additionalAnnualYield: String
    public let yieldName: String
    public let yieldValue: String
    public let termInMonths: Int?
    public let term: String?
    public let realReturn: String
    public let realTerm: Int?
    public let endInvestmentsDate: Int
    public let principalReturnDate: Int?
    public let investmentType: Int?
    public let investmentTypeName: String
    public let propertyType: Int?
    public let propertyTypeName: String
    public let mortgageRank: Int?
    public let mortgageRankName: String
    public let loanStartDate: Int?
    public let mainPhotoURL: String
    public let riskScoringValue: String?
    public let interestDistribution: String?
    
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
        case principalReturnDate = "principal_return_date"
        case investmentType = "investment_type"
        case investmentTypeName = "investment_type_name"
        case propertyType = "property_type"
        case propertyTypeName = "property_type_name"
        case mortgageRank = "mortgage_rank"
        case mortgageRankName = "mortgage_rank_name"
        case loanStartDate = "loan_start_day"
        case mainPhotoURL = "photo"
        case riskScoringValue = "risk_scoring_value"
        case interestDistribution = "interest_distribution"
    }
}
