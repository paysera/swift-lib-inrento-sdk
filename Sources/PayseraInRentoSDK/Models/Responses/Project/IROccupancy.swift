public struct IROccupancy: Decodable {
    public let occupancy: Int
    public let annualReturnRate: String
    public let additionalAnnualReturnRate: String?
    
    private enum CodingKeys: String, CodingKey {
        case occupancy
        case annualReturnRate = "arr"
        case additionalAnnualReturnRate = "additional_arr"
    }
}
