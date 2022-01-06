import Foundation

public class InRentoCredentials {
    public var accessToken: String?
    public var accessTokenExpiresAt: Date?
    public var accessTokenIssuedAt: Date?
    
    public init(
        accessToken: String? = nil,
        accessTokenExpiresAt: Date? = nil,
        accessTokenIssuedAt: Date? = nil
    ) {
        self.accessToken = accessToken
        self.accessTokenExpiresAt = accessTokenExpiresAt
        self.accessTokenIssuedAt = accessTokenIssuedAt
    }
    
    public func hasExpired() -> Bool {
        guard let accessTokenExpiresAt = accessTokenExpiresAt else {
            return false
        }
        
        return accessTokenExpiresAt.timeIntervalSinceNow < 120
    }
    
    public func hasRecentlyRefreshed() -> Bool {
        guard let accessTokenIssuedAt = accessTokenIssuedAt else {
            return false
        }
        
        return abs(accessTokenIssuedAt.timeIntervalSinceNow) < 15
    }
}
