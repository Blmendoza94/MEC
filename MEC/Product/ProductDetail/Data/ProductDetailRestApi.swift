import RxSwift

class ProductDetailRestApi: BaseApiRest<[ProductDetail]>, ProductDetailRepository {
    func getProductDetail(_ productId: String) -> Observable<[ProductDetail]> {
        let urlString = "https://api.mercadolibre.com/items?ids=\(productId)"
        return fetch(
            URL(
                string: urlString
            ) ?? URL(fileURLWithPath: .empty)
        )
    }
}
