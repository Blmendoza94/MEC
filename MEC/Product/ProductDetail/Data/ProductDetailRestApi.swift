import RxSwift

class ProductDetailRestApi: BaseApiRest<[ProductDetail]>, ProductDetailRepository {
    func getProductDetail(_ productId: String) -> Observable<[ProductDetail]> {
        let stringURL = NetworkingConstants.Endpoint.baseDomain
            + NetworkingConstants.Subdomain.items

        let queryItems = [
            URLQueryItem(name: NetworkingConstants.Fields.filterIds, value: productId),
        ]

        var urlComponents = URLComponents(string: stringURL) ?? URLComponents()
        urlComponents.queryItems = queryItems

        return get(urlComponents.url ?? URL(fileURLWithPath: .empty))
    }
}
