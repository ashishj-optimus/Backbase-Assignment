import UIKit

final class SearchViewController: UISearchController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // Mark: - Initializer
    
    init(placeholderText: String = "Search for office loction",
         dimsBackgroundDuringPresentation: Bool = false) {
        super.init(searchResultsController: nil)
        self.dimsBackgroundDuringPresentation = dimsBackgroundDuringPresentation
        self.searchBar.placeholder = placeholderText
        self.searchBar.accessibilityIdentifier = "citySearchBar"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
