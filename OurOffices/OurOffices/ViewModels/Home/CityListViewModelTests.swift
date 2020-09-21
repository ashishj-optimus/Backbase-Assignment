@testable import AllAboutCities
import XCTest

class CityListViewModelTests: XCTestCase {
    
    func testCityResultsIsZeroInitially() {
        let viewModel = cityListViewModel()
        XCTAssertEqual(viewModel.numberOfRows, 0)
    }
    
    func testCitiesUpdatedCalledWhenAPIReturnsSuccess() {
        let viewModel = cityListViewModel()
        let delegate = MockCityResultsViewModelDelegate()
        viewModel.delegate = delegate
        viewModel.fetchCities(fromFile: "cities")
        
        XCTAssert(delegate.isCitiesUpdatedCalled)
    }
    
    func testCitiesUpdatedNotCalledWhenAPIReturnsFailure() {
        let viewModel = cityListViewModel()
        let delegate = MockCityResultsViewModelDelegate()
        viewModel.delegate = delegate
        viewModel.fetchCities(fromFile: "aboutInfo")
        
        XCTAssertFalse(delegate.isCitiesUpdatedCalled)
    }
    
    func testFilter() {
        let viewModel = cityListViewModel()
        let delegate = MockCityResultsViewModelDelegate()
        viewModel.delegate = delegate
        viewModel.fetchCities(fromFile: "cities")
        
        viewModel.filterBy(city: "Denver")
        
        XCTAssertEqual(viewModel.numberOfRows, 7)
    }
    
    func testFilterNoResults() {
        let viewModel = cityListViewModel()
        let delegate = MockCityResultsViewModelDelegate()
        viewModel.delegate = delegate
        viewModel.fetchCities(fromFile: "cities")
        
        viewModel.filterBy(city: "Sydney, IN")
        
        XCTAssertEqual(viewModel.numberOfRows, 0)
    }
    
    func testGetCellViewModelAfterApplyingFilter() {
        let viewModel = cityListViewModel()
        let delegate = MockCityResultsViewModelDelegate()
        viewModel.delegate = delegate
        viewModel.fetchCities(fromFile: "cities")
        
        viewModel.filterBy(city: "Sydney, A")
        
        XCTAssertEqual(viewModel.numberOfRows, 1)
        XCTAssertEqual(viewModel.getCellViewModel(index: 0)?.title, "Sydney, AU")
    }
    
    // MARK: - Helper methods
    
    private func cityListViewModel() -> CityListViewModel {
        let dataStore: CityAPI = DataStore()
        let viewModel = CityListViewModel(dataStore: dataStore)
        
        return viewModel
    }
}

class MockCityResultsViewModelDelegate: CityResultsViewModelDelegate {
    
    var isCitiesUpdatedCalled = false
    var isErrorCalled = false
    func citiesUpdated() {
        isCitiesUpdatedCalled = true
    }
    
    func display(error: Error) {
        isErrorCalled = true
    }
}
