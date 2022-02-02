import Foundation

public struct InRentoError: RawRepresentable {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static let apiAuthenticationFailed = Self(rawValue: "API_AUTHENTICATION_FAILED")
    public static let methodNotFound = Self(rawValue: "METHOD_NOT_EXISTS")
    public static let authenticationRequired = Self(rawValue: "AUTHENTICATION_REQUIRED")
    public static let authenticationFailed = Self(rawValue: "AUTHENTICATION_FAILED")
    public static let accessTokenExpired = Self(rawValue: "ACCESS_TOKEN_EXPIRED")
    public static let badRequest = Self(rawValue: "BAD_REQUEST")
    public static let resourceNotFound = Self(rawValue: "RESOURCE_NOT_FOUND")
    public static let forbidden = Self(rawValue: "FORBIDDEN")
    public static let serverError = Self(rawValue: "SERVER_ERROR")
    public static let valueIncorrect = Self(rawValue: "VALUE_INCORRECT")
    public static let valueRequired = Self(rawValue: "VALUE_REQUIRED")
    public static let refreshTokenIncorrect = Self(rawValue: "REFRESH_TOKEN_INCORRECT")
    public static let userNotFound = Self(rawValue: "USER_NOT_FOUND")
    public static let userNotAvailable = Self(rawValue: "USER_NOT_AVAILABLE")
    public static let userExists = Self(rawValue: "USER_EXISTS")
    public static let userAlreadyLinkedPayseraAccount = Self(rawValue: "USER_LINKED_PREVIOUSLY_PAYSERA_ACCOUNT")
    public static let walletWasAlreadyLinkedToCurrentUser = Self(rawValue: "WALLET_WAS_LINKED_PREVIOUSLY_TO_CURRENT_USER")
    public static let walletWasAlreadyLinkedToOtherUser = Self(rawValue: "WALLET_WAS_LINKED_PREVIOUSLY_TO_OTHER_USER")
    public static let notEnoughFunds = Self(rawValue: "NOT_ENOUGH_FUNDS")
    public static let payseraLimitExceeded = Self(rawValue: "PAYSERA_LIMIT_EXCEEDED")
    public static let payseraAllowanceExceeded = Self(rawValue: "PAYSERA_ALLOWANCE_EXCEEDED")
    public static let investmentsClosed = Self(rawValue: "INVESTMENTS_CLOSED")
    public static let amountIsTooLow = Self(rawValue: "AMOUNT_IS_TOO_LOW")
    public static let amountIsTooBig = Self(rawValue: "AMOUNT_IS_TOO_BIG")
    public static let userAnswerAlreadyExists = Self(rawValue: "USER_ANSWER_ALREADY_EXISTS")
    public static let userAlreadyConfirmedRiskAgreement = Self(rawValue: "USER_ALREADY_CONFIRMED_RISK_AGREEMENT")
    
    public static let cancelled = Self(rawValue: "CANCELLED")
    public static let noInternet = Self(rawValue: "NO_INTERNET")
    public static let unknown = Self(rawValue: "UNKNOWN")
}

extension InRentoError: Decodable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rawValue = try values.decode(String.self, forKey: .rawValue)
    }
    
    private enum CodingKeys: String, CodingKey {
        case rawValue = "error"
    }
}

extension InRentoError: Error {}
