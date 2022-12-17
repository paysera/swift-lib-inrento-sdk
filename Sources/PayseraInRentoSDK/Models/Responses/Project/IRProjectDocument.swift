public struct IRProjectDocument: Decodable {
    public let name: String
    public let url: String
    public let categoryId: Int?
    public let categoryName: String?
    public let language: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
        case categoryId = "category_id"
        case categoryName = "category_name"
        case language
    }
}
