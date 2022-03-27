protocol ProductListView: BaseView {
    var searchText: String? { get set }

    var viewDataList: [ProductViewData]? { get set }

    func showProductDetail(_ productId: String)
}
