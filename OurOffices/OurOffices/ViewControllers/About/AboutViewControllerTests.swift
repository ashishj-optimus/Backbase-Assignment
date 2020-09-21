@testable import AllAboutCities
import XCTest

class AboutViewControllerTests: XCTestCase {
    // MARK: - Dealloc test
    
    func testDealloc() {
        assertObjectWillDealloc {
            let aboutViewController = AboutViewController()
            aboutViewController.viewDidLoad()
            return aboutViewController
        }
    }
}
