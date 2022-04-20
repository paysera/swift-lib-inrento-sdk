public struct IRProjectUpdateResponse: Decodable {
    public let updates: [IRProjectUpdate]
}

public struct IRProjectUpdate: Decodable {
    public let content: String
}
