public struct IRPortfolio: Decodable {
    public let currency: String
    public let accountValue: String
    public let investedFunds: String
    public let outstandingPrincipal: String
    public let netAnnualReturn: String
    public let interest: String
    public let secondaryMarketTransactions: String
    public let serviceFee: String
    public let referralTotal: String
    public let totalProfit: String
    public let interestInLast30Days: String
    public let investments: [IRPortfolioInvestment]
    
    private enum CodingKeys: String, CodingKey {
        case currency
        case accountValue = "account_value"
        case investedFunds = "invested_funds"
        case outstandingPrincipal = "outstanding_principal"
        case netAnnualReturn = "net_annual_return"
        case interest
        case secondaryMarketTransactions = "secondary_market_transactions"
        case serviceFee = "service_fee"
        case referralTotal = "referral_total"
        case totalProfit = "total_profit"
        case interestInLast30Days = "interest_in_30_days"
        case investments
    }
}
