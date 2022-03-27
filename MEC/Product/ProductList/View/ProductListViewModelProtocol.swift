import RxSwift

protocol ProductListViewModelProtocol: AnyObject {
    var coordinator: ProductCoordinator? { get set }

    func getProductList(_ searchText: String) -> Observable<[ProductViewData]?>
    func showProductDetail(_ productId: String)
}
