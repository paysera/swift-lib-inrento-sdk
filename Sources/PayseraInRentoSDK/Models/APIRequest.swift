import Alamofire
import Foundation
import PromiseKit

final class APIRequest {
    public let requestEndpoint: URLRequestConvertible
    public let pendingPromise: (promise: Promise<Data?>, resolver: Resolver<Data?>)
    
    public init<T: URLRequestConvertible>(
        pendingPromise: (promise: Promise<Data?>, resolver: Resolver<Data?>),
        requestEndpoint: T
    ) {
        self.pendingPromise = pendingPromise
        self.requestEndpoint = requestEndpoint
    }
}
