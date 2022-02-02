public struct IRAccount: Decodable {
    public let userID: Int
    public let accountType: IRAccountType
    public let email: String
    public let name: String
    public let surname: String
    public let companyName: String?
    public let invitedUsersCount: Int
    public let verified: Bool
    public let showBeforeInvestQuestionnaire: Bool
    public let showRiskAgreement: Bool
    
    private enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case accountType = "account_type"
        case email
        case name
        case surname
        case companyName = "company_name"
        case invitedUsersCount = "invited_users_count"
        case verified
        case showBeforeInvestQuestionnaire = "show_before_invest_questionnaire"
        case showRiskAgreement = "show_risk_agreement"
    }
}
