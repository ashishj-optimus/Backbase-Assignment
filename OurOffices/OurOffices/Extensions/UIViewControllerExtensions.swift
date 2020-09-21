import UIKit

extension UIViewController {
    func add(childViewController: UIViewController) {
        self.addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
}
