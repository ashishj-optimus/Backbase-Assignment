import UIKit

// MARK: - CityListViewController implementation

final class CityListViewController: UIViewController {

    private var viewModel: CityListViewModelProtocol
    private lazy var searchController = SearchViewController()
    weak var citySelectionDelegate: CitySelectionDelegate?
    
    // MARK: - Initializer
    
    init(viewModel: CityListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.fetchCities(fromFile: "cities")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        setUp()
    }
    
    private func setUp() {
        setupNavigationBar()
        setupMainView()
        setUpSearchBar()
    }
    
    private func setupNavigationBar() {
        self.title = "Office Locations"
        navigationController?.navigationBar.barTintColor = Color.navigationBar
        navigationController?.navigationBar.tintColor = Color.main
        let textAttributes = [NSAttributedString.Key.foregroundColor: Color.main]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func setupMainView() {
        view.addSubview(cityResultsTableView)
        setupConstraints()
    }
    
    private lazy var cityResultsTableView: UITableView = {
        let cityResultsTableView = UITableView().withAutoLayout()
        cityResultsTableView.delegate = self
        cityResultsTableView.dataSource = self
        cityResultsTableView.accessibilityIdentifier = "cityListTable"
        cityResultsTableView.tableFooterView = UIView()
        return cityResultsTableView
    }()
    
    private func setupConstraints() {
        var constraints = cityResultsTableView.constraintsToFillSuperviewHorizontally()
        constraints += cityResultsTableView.constraintsToFillSuperviewVertically()
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setUpSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        cityResultsTableView.tableHeaderView = searchController.searchBar
    }
}

// MARK: - CityResultsViewModelDelegate

extension CityListViewController: CityResultsViewModelDelegate {
    func citiesUpdated() {
        cityResultsTableView.reloadData()
    }
    
    func display(error: Error) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension CityListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.getCellViewModel(index: indexPath.row)
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }

        cell!.textLabel?.text = cellViewModel?.title
        cell!.detailTextLabel?.text = cellViewModel?.location
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCellViewModel = viewModel.getCellViewModel(index: indexPath.row) else {
            return
        }
        
        self.citySelectionDelegate?.citySelected(newCity: selectedCellViewModel.city)
        if let detailViewController = citySelectionDelegate as? CityMapViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
}

// MARK: - UISearchResultsUpdating

extension CityListViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text {
            viewModel.filterBy(city: searchString)
            cityResultsTableView.reloadData()
        }
    }
}
