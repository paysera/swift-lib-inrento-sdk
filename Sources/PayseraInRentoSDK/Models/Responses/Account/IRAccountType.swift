public struct IRAccountType: RawRepresentable {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let privatePerson = Self(rawValue: 1)
    public static let company = Self(rawValue: 2)
}

extension IRAccountType: Decodable {}
