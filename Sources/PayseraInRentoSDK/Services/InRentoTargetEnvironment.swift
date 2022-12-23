import Foundation

public enum InRentoEnvironment {
    case test
    case prod
}

public final class InRentoTargetEnvironment {
    public private(set) static var current: InRentoEnvironment = .prod
    
    public init(environment: InRentoEnvironment) {
        Self.current = environment
    }
}

