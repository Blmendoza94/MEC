import RxSwift

protocol ProductDetailViewModelProtocol: ViewModel {
    var coordinator: ProductCoordinator? { get set }

    func getProductDetail(_ productId: String) -> Observable<ProductDetailViewData?>
}
