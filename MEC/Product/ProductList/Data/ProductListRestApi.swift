import RxSwift

class ProductListRestApi: BaseApiRest<ProductInformation>, ProductListRepository {
    func getProductList(_ searchText: String) -> Observable<ProductInformation> {
        let urlString = "https://api.mercadolibre.com/sites/MLC/search?q=\(searchText)"
        return fetch(
            URL(
                string: urlString
            ) ?? URL(fileURLWithPath: .empty)
        )
    }
}
