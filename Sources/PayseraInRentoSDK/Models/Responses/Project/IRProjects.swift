public struct IRProjects: Decodable {
    public let totalProjects: Int
    public let projects: [IRProject]
    
    private enum CodingKeys: String, CodingKey {
        case totalProjects = "total_projects"
        case projects
    }
}
