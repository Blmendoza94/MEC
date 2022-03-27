protocol SearchProductViewModelProtocol: AnyObject {
    var coordinator: ProductCoordinator? { get set }

    func showProductSearch(_ searchText: String)
}
