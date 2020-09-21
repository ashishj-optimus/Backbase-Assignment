import UIKit

// MARK: - AppCoordinator implementation

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let splitVC = UISplitViewController()
        
        let dataStore: CityAPI = DataStore()
        let cityListViewModel = CityListViewModel(dataStore: dataStore)
        let masterVC = CityListViewController(viewModel: cityListViewModel)
        
        let detailsVC = CityMapViewController()
        
        let masterNavigationController = UINavigationController(rootViewController: masterVC)
        let detailNavigationController = UINavigationController(rootViewController: detailsVC)
        
        masterVC.citySelectionDelegate = detailsVC
        splitVC.viewControllers = [masterNavigationController, detailNavigationController]
        window.rootViewController = splitVC
        window.makeKeyAndVisible()
    }
}
