import Foundation

extension Array {
    
    /// Returns the element at the index if it is within bounds, otherwise nil.
    public func subscriptSafe(_ index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
