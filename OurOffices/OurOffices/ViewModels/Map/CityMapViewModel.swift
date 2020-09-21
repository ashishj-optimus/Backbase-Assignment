import CoreLocation

// MARK: - CityMapViewModel implementation

final class CityMapViewModel: CityMapViewModelProtocol {
    
    var selectedCity: City?
    
    init() {}
    
    var annotationCoordinates: CLLocationCoordinate2D? {
        guard let city = selectedCity else {
            return nil
        }
        return CLLocationCoordinate2D(latitude: city.coordinates.latitude, longitude: city.coordinates.longitude)
    }
}

