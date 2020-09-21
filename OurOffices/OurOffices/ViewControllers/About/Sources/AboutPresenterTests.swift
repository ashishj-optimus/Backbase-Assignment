@testable import AllAboutCities
import XCTest

class AboutPresenterTests: XCTestCase {
    func testIsLoadAboutInfoCalled() {
        let mockAboutView = MockAboutView()
        let mockAboutModel = MockAboutModel()
        let presenter = Presenter(view: mockAboutView, model: mockAboutModel)
        presenter.loadAboutInfo()
        
        XCTAssertTrue(mockAboutModel.isLoadAboutInfoCalled)
    }
    
    func testIsSetActivityIndicatorCalled() {
        let mockAboutView = MockAboutView()
        let mockAboutModel = MockAboutModel()
        let presenter = Presenter(view: mockAboutView, model: mockAboutModel)
        presenter.loadAboutInfo()
        
        XCTAssertTrue(mockAboutView.isSetActivityIndicatorCalled)
    }
}
