import Foundation

final public class InRentoCredentials {
    public var accessToken: String?
    public var accessTokenExpiresAt: Date?
    public var accessTokenIssuedAt: Date?
    public var refreshToken: String?
    public var refreshTokenExpiresAt: Date?
    
    public init(
        accessToken: String? = nil,
        accessTokenExpiresAt: Date? = nil,
        accessTokenIssuedAt: Date? = nil,
        refreshToken: String? = nil,
        refreshTokenExpiresAt: Date? = nil,
    ) {
        self.accessToken = accessToken
        self.accessTokenExpiresAt = accessTokenExpiresAt
        self.accessTokenIssuedAt = accessTokenIssuedAt
        self.refreshToken = refreshToken
        self.refreshTokenExpiresAt = refreshTokenExpiresAt
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
