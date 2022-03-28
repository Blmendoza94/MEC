import RxSwift

class ProductDetailRestApi: BaseRestApi<[ProductDetail]>, ProductDetailRepository {
    override init(session: NetworkSession = URLSession.shared) {
        super.init(session: session)
    }

    func getProductDetail(_ productId: String) -> Observable<[ProductDetail]> {
        let stringURL = NetworkingConstants.Endpoint.baseDomain
            + NetworkingConstants.Subdomain.items

        let queryItems = [
            URLQueryItem(name: NetworkingConstants.Fields.filterIds, value: productId),
        ]

        var urlComponents = URLComponents(string: stringURL) ?? URLComponents()
        urlComponents.queryItems = queryItems

        var request = URLRequest(url: urlComponents.url ?? URL(fileURLWithPath: .empty))
        request.httpMethod = NetworkingConstants.Method.get

        return execute(request)
    }
}
