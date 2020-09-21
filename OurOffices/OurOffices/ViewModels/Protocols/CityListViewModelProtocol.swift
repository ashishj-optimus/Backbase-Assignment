protocol CityListViewModelProtocol {
    var numberOfRows: Int { get }
    var delegate: CityResultsViewModelDelegate? { get set }
    func getCellViewModel(index: Int) -> ListDataProvider?
    func fetchCities(fromFile: String)
    func filterBy(city: String?)
}
