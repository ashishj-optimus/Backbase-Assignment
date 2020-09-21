@testable import AllAboutCities
import XCTest

class CityMapViewControllerTests: XCTestCase {
    // MARK: - Dealloc test
    
    func testDealloc() {
        assertObjectWillDealloc {
            let cityMapViewController = CityMapViewController()
            cityMapViewController.viewDidLoad()
            return cityMapViewController
        }
    }
}
