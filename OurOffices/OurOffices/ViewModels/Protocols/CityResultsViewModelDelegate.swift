protocol CityResultsViewModelDelegate: class {
    func citiesUpdated()
    func display(error: Error)
}
