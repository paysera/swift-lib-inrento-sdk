public struct IRProjectUpdate: Decodable {
    public let message: String
    public let date: IRDate
}

public struct IRDate: Decodable {
    public let date: String
}
