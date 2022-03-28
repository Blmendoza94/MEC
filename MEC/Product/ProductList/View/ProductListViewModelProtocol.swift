import RxSwift

protocol ProductListViewModelProtocol: ViewModel {
    func getProductList(_ searchText: String) -> Observable<[ProductViewData]?>
    func showProductDetail(_ productId: String)
    func closeView()
}
