import Foundation

public enum InRentoEnvironment {
    case test
    case prod
}

public protocol InRentoTargetEnvironmentInterface {
    static var current: InRentoEnvironment { get }
}

public final class InRentoTargetEnvironment: InRentoTargetEnvironmentInterface {
    public private(set) static var current: InRentoEnvironment = .prod
    
    public init(environment: InRentoEnvironment) {
        Self.current = environment
    }
}

