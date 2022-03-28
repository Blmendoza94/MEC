import RxSwift

protocol ProductDetailViewModelProtocol: ViewModel {
    func getProductDetail(_ productId: String) -> Observable<ProductDetailViewData?>
    func closeView()
}
