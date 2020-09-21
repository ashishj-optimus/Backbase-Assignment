protocol ListDataProvider{
    var city: City { get }
    var title: String { get }
    var location: String { get }
}

// MARK: - CityCellViewModel implementation

final class CityCellViewModel: ListDataProvider {
    let city: City
    
    // MARK: - Initializer
    
    init(city: City) {
        self.city = city
    }
    
    // MARK: - Private(set)
    
    private(set) lazy var title: String = {
        return "\(city.name), \(city.countryCode)"
    }()
    
    private(set) lazy var location: String = {
        return "Location: \(city.coordinates.latitude), \(city.coordinates.longitude)"
    }()
}
