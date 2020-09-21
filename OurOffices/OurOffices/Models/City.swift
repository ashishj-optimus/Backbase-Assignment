import CoreLocation

// MARK: - City Object

struct City: Codable {
    var id: Int
    var countryCode: String
    var name: String
    var coordinates: Coordinates
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case countryCode = "country"
        case name = "name"
        case coordinates = "coord"
    }
}

// MARK: - City Coordinates object

struct Coordinates: Codable {
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}
