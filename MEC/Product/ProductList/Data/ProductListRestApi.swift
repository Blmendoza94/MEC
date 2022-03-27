import RxSwift

class ProductListRestApi: BaseApiRest<ProductInformation>, ProductListRepository {
    func getProductList(_ searchText: String) -> Observable<ProductInformation> {
        typealias Subdomain = NetworkingConstants.Subdomain

        let stringURL = NetworkingConstants.Endpoint.baseDomain + Subdomain.sites
            + Subdomain.mlc + Subdomain.search

        let queryItems = [
            URLQueryItem(name: NetworkingConstants.Fields.filter, value: searchText),
        ]

        var urlComponents = URLComponents(string: stringURL) ?? URLComponents()
        urlComponents.queryItems = queryItems

        return get(urlComponents.url ?? URL(fileURLWithPath: .empty))
    }
}
