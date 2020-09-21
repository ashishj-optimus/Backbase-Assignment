class SearchStore {
    typealias Node = SearchStoreNode<Character>
    let root: Node
    init() {
        root = Node()
    }
}

// MARK: - Insert and Find
extension SearchStore {
    
    /// Method to insert a word into SearchStore. If the word already exists then there is no change in the structure.
    /// Organizes the string data in a hierarchy.
    /// This hierarchy can store a unlimited number of leaf nodes.
    /// It uses a loop which compares the keyword length with the current node’s level. If no match occurs, it creates a new node.
    
    func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        
        var currentNode = root
        let characters = Array(word.lowercased())
        var currentIndex = 0
        
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }
            
            currentIndex += 1
            
            if currentIndex == characters.count {
                currentNode.isTerminating = true
            }
        }
    }
    
    /// Establish a while loop to navigate the SearchStore hierarchy. Uses an Array to return list of possible words.
    /// with given prefix
    
    func find(prefix: String) -> [String] {
        var words = [String]()
        let prefixLowerCased = prefix.lowercased()
        if let lastNode = findLastNodeOf(word: prefixLowerCased) {
            if lastNode.isTerminating {
                words.append(prefixLowerCased)
            }
            for childNode in lastNode.children.values {
                let childWords = wordsInSubSearchStore(rootNode: childNode, partialWord: prefixLowerCased)
                words += childWords
            }
        }
        return words
    }
    
    // Mark: - Private methods
    
    private func findLastNodeOf(word: String) -> Node? {
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return nil
            }
            currentNode = childNode
        }
        return currentNode
    }
    
    private func wordsInSubSearchStore(rootNode: Node, partialWord: String) -> [String] {
        var subSearchStoreWords = [String]()
        var previousLetters = partialWord
        if let value = rootNode.value {
            previousLetters.append(value)
        }
        if rootNode.isTerminating {
            subSearchStoreWords.append(previousLetters)
        }
        for childNode in rootNode.children.values {
            let childWords = wordsInSubSearchStore(rootNode: childNode, partialWord: previousLetters)
            subSearchStoreWords += childWords
        }
        return subSearchStoreWords
    }
}
