public struct IRDocument: Decodable {
    public let name: String
    public let contentType: String
    public let content: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case contentType = "content_type"
        case content
    }
}
