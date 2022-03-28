enum NetworkingConstants {
    enum Endpoint {
        static let baseDomain = "https://api.mercadolibre.com"
    }

    enum Subdomain {
        static let sites = "/sites"
        static let mlc = "/MLC"
        static let search = "/search"
        static let items = "/items"
    }

    enum Fields {
        static let filter = "q"
        static let filterIds = "ids"
    }

    enum Method {
        static let get = "GET"
        static let post = "POST"
    }
}
