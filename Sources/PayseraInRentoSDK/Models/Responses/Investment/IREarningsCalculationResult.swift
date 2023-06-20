public struct IREarningsCalculationResult: Decodable {
    public let earn: Double?
    public let earnAdditional: Double?
    public let totalExpectedEarnings: Double?
    public let totalExpectedEarningsAdditional: Double?
    public let capitalGainPercentage: String?
    public let projectId: String?
    public let annualYield: Double?
    public let additionalAnnualYield: Double?
    
    private enum CodingKeys: String, CodingKey {
        case earn
        case earnAdditional = "earn_additional"
        case totalExpectedEarnings = "total_expected_earnings"
        case totalExpectedEarningsAdditional = "total_expected_earnings_additional"
        case capitalGainPercentage = "capital_gain_percentage"
        case projectId = "project_id"
        case annualYield = "annual_yield"
        case additionalAnnualYield = "additional_annual_yield"
    }
}
