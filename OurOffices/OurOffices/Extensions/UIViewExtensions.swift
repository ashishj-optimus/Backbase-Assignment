import UIKit

public extension UIView {
    @objc public var autolayout: Bool {
        get {
            return !translatesAutoresizingMaskIntoConstraints
        }
        
        set(newValue) {
            translatesAutoresizingMaskIntoConstraints = !newValue
        }
    }
    
    @discardableResult
    @objc public func withAutoLayout() -> Self {
        autolayout = true
        return self
    }
    
    @objc public func constraintsToFillSuperviewHorizontally(margins: CGFloat = 0) -> [NSLayoutConstraint] {
        return constraintsToFillSuperviewHorizontally(leadingMargin: margins, trailingMargin: -margins)
    }
    
    @objc public func constraintsToFillSuperviewVertically(margins: CGFloat = 0) -> [NSLayoutConstraint] {
        return constraintsToFillSuperviewVertically(topMargin: margins, bottomMargin: -margins)
    }
    
    @objc public func constraintsToFillSuperviewVertically(topMargin: CGFloat, bottomMargin: CGFloat) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            fatalError("This view does not have a superview: \(self)")
        }
        let top = topAnchor.constraint(equalTo: superview.topAnchor, constant: topMargin)
        let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottomMargin)
        return [top, bottom]
    }
    
    @objc public func constraintsToFillSuperviewHorizontally(leadingMargin: CGFloat, trailingMargin: CGFloat) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            fatalError("This view does not have a superview: \(self)")
        }
        let leader = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leadingMargin)
        let trailer = trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailingMargin)
        return [leader, trailer]
    }
}
