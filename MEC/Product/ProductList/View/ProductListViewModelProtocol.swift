import RxSwift

protocol ProductListViewModelProtocol: ViewModel {
    var coordinator: ProductCoordinator? { get set }

    func getProductList(_ searchText: String) -> Observable<[ProductViewData]?>
    func showProductDetail(_ productId: String)
}
