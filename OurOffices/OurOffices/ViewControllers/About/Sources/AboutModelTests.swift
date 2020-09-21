@testable import AllAboutCities
import XCTest

class AboutModelTests: XCTestCase {
    func testAboutInfoDidFailLoading() {
        let model = Model()
        let mockPresenter = MockPresenter()
        model.loadAboutInfo(file: "aboutInfo1", with: mockPresenter)
        XCTAssert(mockPresenter.isAboutInfoDidFailLoadingCalled)
    }
    
    func testIsSetActivityIndicatorCalled() {
        let model = Model()
        let mockAboutView = MockAboutView()
        let mockPresenter = Presenter(view: mockAboutView, model: model)
        model.loadAboutInfo(file: "aboutInfo1", with: mockPresenter)
        XCTAssertTrue(mockAboutView.isSetActivityIndicatorCalled)
    }
}
