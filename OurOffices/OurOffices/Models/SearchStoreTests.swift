@testable import AllAboutCities
import XCTest

class SearchStoreTests: XCTestCase {
    
    func testSearchStoreBeforeInserting() {
        let searchStore = SearchStore()
        XCTAssertEqual(searchStore.root.children.count, 0)
    }
    
    func testSearchStoreAfterInsertingOneWord() {
        let searchStore = SearchStore()
        insertWordsSearchStore(searchStore: searchStore)
        XCTAssertEqual(searchStore.root.children.count, 1)
    }
    
    func testInsert() {
        let searchStore = SearchStore()
        let wordArray = ["Alabama, US", "Sydney, AU"]
        insertWordsSearchStore(wordArray: wordArray, searchStore: searchStore)
        XCTAssertEqual(searchStore.root.children.count, 2)
    }
    
    func testRootNodeChildrenWhenWordsWithSameInitialsAreAdded() {
        let searchStore = SearchStore()
        let wordArray = ["Alabama, US", "Albuquerque, AU"]
        insertWordsSearchStore(wordArray: wordArray, searchStore: searchStore)
        XCTAssertEqual(searchStore.root.children.count, 1)
    }
    
    func testFindWithOneCharacter() {
        let searchStore = SearchStore()
        let wordArray = ["Alabama, US", "Albuquerque, AU", "Anaheim, US", "Arizona, US", "Sydney, AU"]
        insertWordsSearchStore(wordArray: wordArray, searchStore: searchStore)
        
        let searchResults = searchStore.find(prefix: "A")
        XCTAssertEqual(searchResults.count, 4)
        XCTAssert(searchResults.contains("alabama, us"))
        XCTAssert(searchResults.contains("albuquerque, au"))
        XCTAssert(searchResults.contains("anaheim, us"))
        XCTAssert(searchResults.contains("arizona, us"))
    }
    
    func testFindWithTwoCharacters() {
        let searchStore = SearchStore()
        let wordArray = ["Alabama, US", "Albuquerque, AU", "Anaheim, US", "Arizona, US", "Sydney, AU"]
        insertWordsSearchStore(wordArray: wordArray, searchStore: searchStore)
        
        let searchResults = searchStore.find(prefix: "Al")
        XCTAssertEqual(searchResults.count, 2)
        XCTAssert(searchResults.contains("alabama, us"))
        XCTAssert(searchResults.contains("albuquerque, au"))
    }

    // MARK: - Private methods
    
    private func insertWordsSearchStore(wordArray: [String] = ["Alabama, US"],
                                        searchStore: SearchStore) {
        for word in wordArray {
            searchStore.insert(word: word)
        }
    }
}
