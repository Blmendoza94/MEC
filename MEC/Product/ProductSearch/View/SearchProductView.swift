protocol SearchProductView: BaseView {
    var viewModel: SearchProductViewModelProtocol? { get set }

    func showProductList(_ searchText: String)
}
