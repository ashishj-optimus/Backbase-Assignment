import CoreLocation
protocol CityMapViewModelProtocol {
    var annotationCoordinates: CLLocationCoordinate2D? { get }
    var selectedCity: City? { get set }
}
