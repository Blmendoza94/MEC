import RxSwift

protocol ProductListRepository {
    func getProductList(_ searchText: String) -> Observable<ProductInformation>
}
