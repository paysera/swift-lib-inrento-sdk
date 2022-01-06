import PromiseKit

public protocol InRentoTokenRefresherInterface {
    func refreshToken() -> Promise<Void>
}
