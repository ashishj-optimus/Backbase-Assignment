@testable import AllAboutCities
import XCTest

class CityCellViewModelTests: XCTestCase {
    func testTitle() {
        let city = CityStub.getCity()
        let cellViewModel = CityCellViewModel(city: city)
        
        XCTAssertEqual(cellViewModel.title, "Denver, US")
    }
    
    func testLocation() {
        let city = CityStub.getCity()
        let cellViewModel = CityCellViewModel(city: city)
        
        XCTAssertEqual(cellViewModel.location, "Location: 39.7392, 104.9903")
    }
}
