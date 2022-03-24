import RxSwift

protocol SearchProductRepository {
    func getProducts(category: String) -> Observable<IndicatorList>
}
