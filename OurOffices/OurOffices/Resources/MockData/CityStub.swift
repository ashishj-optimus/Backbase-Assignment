@testable import AllAboutCities
import CoreLocation

// MARK: - CityStub

class CityStub {
    public static func results() -> [City] {
        return [
            CityStub.getCity(),
            CityStub.getCity(),
            CityStub.getCity(),
            CityStub.getCity()
        ]
    }
    
    static func getCity(id: Int = 1234,
                        countryCode: String = "US",
                        name: String = "Denver",
                        latitude: Double = 39.7392,
                        longitude: Double = 104.9903) -> City {
        return City(id: id,
                    countryCode: countryCode,
                    name: name,
                    coordinates: Coordinates(latitude: latitude, longitude: longitude))
    }
}
