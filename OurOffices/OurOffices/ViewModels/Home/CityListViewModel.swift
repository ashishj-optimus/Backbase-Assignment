import UIKit

// MARK: - CityListViewModel implementation

final class CityListViewModel: CityListViewModelProtocol {
    
    weak var delegate: CityResultsViewModelDelegate?
    private var results: [ListDataProvider] = []
    private var filteredCities: [ListDataProvider]?
    private let dataStore: CityAPI
    private let searchStore = SearchStore()
    private var map: [String: ListDataProvider] = [:]
    
    // Mark: - Initializer
    
    init(dataStore: CityAPI) {
        self.dataStore = dataStore
    }
    
    var numberOfRows: Int {
        return filteredCities?.count ?? 0
    }
    
    func getCellViewModel(index: Int) -> ListDataProvider? {
        return filteredCities?.subscriptSafe(index)
    }
    
    // Mark: - Fetching Citites
    
    func fetchCities(fromFile: String) {
        dataStore.fetchData(fileName: fromFile) {[weak self] (response: ResponseResult<City>) in
            switch response {
            case .error(let error):
                self?.failedToFetchCities(error: error)
            case .success(let result):
                self?.didReceive(cityResults: result)
            }
        }
    }
    
    // Mark: - Filtering
    
    func filterBy(city: String?) {
        guard let cityName = city, !cityName.isEmpty else {
            filteredCities = results
            return
        }
        
        var resultSet: [ListDataProvider] = []
        
        let filteredNames = searchStore.find(prefix: cityName.lowercased())
        
        guard filteredNames.count > 0 else {
            filteredCities = []
            return
        }
        
        for name in filteredNames {
            if let city = map[name] {
                resultSet.append(city)
            }
        }
        filteredCities = resultSet
    }
    
    //MARK: - Private methods
    
    private func failedToFetchCities(error: Error) {
        self.delegate?.display(error: error)
    }
    
    private func didReceive(cityResults: [City]?) {
        guard var cityResults = cityResults, cityResults.count > 0 else {
            return
        }
        
        cityResults.sort(by: { $0.name < $1.name })
        
        var suffix = 0
        var cellViewModels = [CityCellViewModel]()
        for city in cityResults {
            let cellViewModel = CityCellViewModel(city: city)
            cellViewModels.append(cellViewModel)
            let key = "\(cellViewModel.title)\(suffix)".lowercased()
            addStringToSearchStore(key: key)
            createDataMap(key: key, viewModel: cellViewModel)
            suffix += 1
        }
        results = cellViewModels
        filteredCities = cellViewModels
        self.delegate?.citiesUpdated()
    }
    
    /*
     A dictionary to hold city as key and ListDataProvider as value.
     This is used to get the matching values from the SearchStore result set.
     */
    private func createDataMap(key: String, viewModel: ListDataProvider) {
        map[key] = viewModel
    }
    
    // Mark: - Data Structure
    
    /// Method to insert a word into SearchStore. If the word already exists then there is no change in the structure.
    /// Organizes the string data in a hierarchy.
    /// This hierarchy can store a unlimited number of leaf nodes.
    /// It uses a loop which compares the keyword length with the current node’s level. If no match occurs, it creates a new node.
    
    private func addStringToSearchStore(key: String) {
        searchStore.insert(word: key)
    }
}
