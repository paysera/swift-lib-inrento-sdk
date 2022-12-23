public struct InRentoHeader {
    public let name: String
    public let value: String
    
    public init(
        name: String,
        value: String
    ) {
        self.name = name
        self.value = value
    }
    
    public static func locale(_ value: String) -> InRentoHeader {
        InRentoHeader(name: "X-LOCALE", value: value)
    }
    
    public static func apiKey(_ value: String) -> InRentoHeader {
        InRentoHeader(name: "X-API-Key", value: value)
    }
}
