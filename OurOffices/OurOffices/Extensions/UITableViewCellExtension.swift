import UIKit

public extension UITableViewCell {
    public static var defaultReuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
