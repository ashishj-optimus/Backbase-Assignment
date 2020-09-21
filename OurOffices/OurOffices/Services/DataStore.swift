import Foundation

enum ResponseResult<T: Codable> {
    case success(result: [T])
    case error(Error)
}

// MARK: - DataStore implementation

struct DataStore: CityAPI {
    
    func fetchData<T>(fileName: String, onCompletion: (ResponseResult<T>) -> Void) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let response = try decoder.decode([T].self, from: data)
                onCompletion(.success(result: response))
            } catch let error {
                onCompletion(.error(error))
            }
        }
    }
}

