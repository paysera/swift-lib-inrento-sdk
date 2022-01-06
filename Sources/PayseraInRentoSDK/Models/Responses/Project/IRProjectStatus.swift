public struct IRProjectStatus: RawRepresentable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let funding = Self(rawValue: 1)
    public static let done = Self(rawValue: 2)
    public static let returned = Self(rawValue: 3)
}

extension IRProjectStatus: Decodable {}
