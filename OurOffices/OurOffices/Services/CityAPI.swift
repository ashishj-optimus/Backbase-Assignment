protocol CityAPI {
    func fetchData<T>(fileName: String, onCompletion: (ResponseResult<T>) -> Void)
}
