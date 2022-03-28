import RxSwift

class ProductListRestApi: BaseRestApi<ProductInformation>, ProductListRepository {
    override init(session: NetworkSession = URLSession.shared) {
        super.init(session: session)
    }

    func getProductList(_ searchText: String) -> Observable<ProductInformation> {
        typealias Subdomain = NetworkingConstants.Subdomain

        let stringURL = NetworkingConstants.Endpoint.baseDomain + Subdomain.sites
            + Subdomain.mlc + Subdomain.search

        let queryItems = [
            URLQueryItem(name: NetworkingConstants.Fields.filter, value: searchText),
        ]

        var urlComponents = URLComponents(string: stringURL) ?? URLComponents()
        urlComponents.queryItems = queryItems

        var request = URLRequest(url: urlComponents.url ?? URL(fileURLWithPath: .empty))
        request.httpMethod = NetworkingConstants.Method.get

        return execute(request)
    }
}
