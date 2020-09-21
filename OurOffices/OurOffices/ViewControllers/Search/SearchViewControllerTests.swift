@testable import AllAboutCities
import XCTest

class SearchViewControllerTests: XCTestCase {
    
    // MARK: - Dealloc test
    
    func testDealloc() {
        assertObjectWillDealloc {
            let searchViewController = SearchViewController()
            searchViewController.viewDidLoad()
            return searchViewController
        }
    }
    
    // Mark: - Functional tests
    
    func testSearchbarPlaceholderText() {
        let searchViewController = SearchViewController(placeholderText: "abc")
        XCTAssertEqual(searchViewController.searchBar.placeholder, "abc")
    }
    
    func testDimsBackgroundDuringPresentation() {
        let searchViewController = SearchViewController(dimsBackgroundDuringPresentation: true)
        XCTAssert(searchViewController.dimsBackgroundDuringPresentation)
    }
}
