protocol SearchProductViewModelProtocol: ViewModel {
    var coordinator: ProductCoordinator? { get set }

    func showProductSearch(_ searchText: String)
}
