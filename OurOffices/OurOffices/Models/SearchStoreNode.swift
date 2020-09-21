class SearchStoreNode<T: Hashable> {
    var value: T?
    var parent: SearchStoreNode?
    var children: [T: SearchStoreNode] = [:]
    var isTerminating = false
    
    init(value: T? = nil, parent: SearchStoreNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(child: T) {
        guard children[child] == nil else {
            return
        }
        children[child] = SearchStoreNode(value: child, parent: self)
    }
}
