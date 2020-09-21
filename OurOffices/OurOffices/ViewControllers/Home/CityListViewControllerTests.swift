@testable import AllAboutCities
import XCTest

class CityListViewControllerTests: XCTestCase {

    // MARK: - Dealloc test
    
    func testDealloc() {
        assertObjectWillDealloc {
            let mockCityListViewModel = MockCityListViewModel()
            let cityListViewController = CityListViewController(viewModel: mockCityListViewModel)
            cityListViewController.viewDidLoad()
            return cityListViewController
        }
    }
}

private class MockCityListViewModel: CityListViewModelProtocol {
    
    private var results: [ListDataProvider] = []
    private var filteredCities: [ListDataProvider] = []
    var numberOfRows: Int = 20
    weak var delegate: CityResultsViewModelDelegate?
    
    func getCellViewModel(index: Int) -> ListDataProvider? {
        return nil
    }
    
    func fetchCities(fromFile: String) {
        
    }
    
    func filterBy(city: String?) {
        
    }
}
