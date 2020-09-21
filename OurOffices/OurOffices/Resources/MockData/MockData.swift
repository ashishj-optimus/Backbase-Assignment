@testable import AllAboutCities

// Mark: - MockPresenter

class MockPresenter: AboutPresenter {
    var isLoadAboutInfoCalled = false
    var isAboutInfoDidLoadCalled = false
    var isAboutInfoDidFailLoadingCalled = false
    
    func loadAboutInfo() {
        isLoadAboutInfoCalled = true
    }
    
    func aboutInfoDidLoad(aboutInfo: AboutInfoData) {
        isAboutInfoDidLoadCalled = true
    }
    
    func aboutInfoDidFailLoading(error: ModelError) {
        isAboutInfoDidFailLoadingCalled = true
    }
}

// MARK: - MockAboutModel

class MockAboutModel: AboutModel {
    var isLoadAboutInfoCalled = false
    func loadAboutInfo(file: String?, with presenter: AboutPresenter) {
        isLoadAboutInfoCalled = true
    }
}

// MARK: - MockAboutView

class MockAboutView: AboutView {
    var isConfigureCalled = false
    var isDisplayCalled = false
    var isSetActivityIndicatorCalled = false
    
    func configure(with aboutInfo: AboutInfoData) {
        isConfigureCalled = true
    }
    
    func display(error: ModelError) {
        isDisplayCalled = true
    }
    
    func setActivityIndicator(hidden: Bool) {
        isSetActivityIndicatorCalled = true
    }
}
