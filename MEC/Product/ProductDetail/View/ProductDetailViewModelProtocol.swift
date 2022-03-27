import RxSwift

protocol ProductDetailViewModelProtocol: AnyObject {
    var coordinator: ProductCoordinator? { get set }

    func getProductDetail(_ productId: String) -> Observable<ProductDetailViewData?>
}
