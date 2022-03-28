import Foundation

struct Product: Codable {
    let productId: String?
    let siteId: String?
    let title: String?
    let seller: Seller?
    let price: Int?
    let prices: Prices?
    let salePrice: Int?
    let currencyId: String?
    let availableQuantity: Int?
    let soldQuantity: Int?
    let buyingMode: String?
    let listingTypeId: String?
    let stopTime: String?
    let condition: String
    let permalink: String?
    let thumbnail: String?
    let thumbnailId: String?
    let acceptsMercadopago: Bool?
    let installments: Installments?
    let address: Address?
    let shipping: Shipping?
    let sellerAddress: SellerAddress?
    let attributes: [Attribute?]?
    let originalPrice: Int?
    let categoryId: String?
    let officialStoreId: Int?
    let domainId: String?
    let catalogProductId: String?
    let tags: [String?]?
    let orderBackend: Int?
    let useThumbnailId: Bool?
    let offerScore: Int?
    let offerShare: Int?
    let matchScore: Int?
    let winnerItemId: Int?
    let melicoin: Int?

    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case siteId = "site_id"
        case title
        case seller
        case price
        case prices
        case salePrice = "sale_price"
        case currencyId = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeId = "listing_type_id"
        case stopTime = "stop_time"
        case condition
        case permalink
        case thumbnail
        case thumbnailId = "thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case installments
        case address
        case shipping
        case sellerAddress = "seller_address"
        case attributes
        case originalPrice = "original_price"
        case categoryId = "category_id"
        case officialStoreId = "official_store_id"
        case domainId = "domain_id"
        case catalogProductId = "catalog_product_id"
        case tags
        case orderBackend = "order_backend"
        case useThumbnailId = "use_thumbnail_id"
        case offerScore = "offer_score"
        case offerShare = "offer_share"
        case matchScore = "match_score"
        case winnerItemId = "winner_item_id"
        case melicoin
    }
}
