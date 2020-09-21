@testable import AllAboutCities
import XCTest

class CityMapViewModelTests: XCTestCase {
    
    func testAnnotationCoordinates() {
        
        let viewModel = CityMapViewModel()
        let city = CityStub.getCity()
        viewModel.selectedCity = city
        
        XCTAssertEqual(viewModel.annotationCoordinates?.latitude, 39.7392)
        XCTAssertEqual(viewModel.annotationCoordinates?.longitude, 104.9903)
    }
}
