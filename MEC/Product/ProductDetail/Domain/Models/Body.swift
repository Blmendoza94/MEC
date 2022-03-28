import Foundation

struct Body: Codable {
    let productId: String?
    let siteId: String?
    let title: String?
    let subtitle: String?
    let sellerId: Int?
    let categoryId: String?
    let officialStoreId: Int?
    let price: Int?
    let basePrice: Int?
    let originalPrice: Int?
    let currencyId: String?
    let initialQuantity: Int?
    let availableQuantity: Int?
    let soldQuantity: Int?
    let saleTerms: [SaleTerms]?
    let buyingMode: String?
    let listingTypeId: String?
    let startTime: String?
    let stopTime: String?
    let condition: String?
    let permalink: String?
    let thumbnailId: String?
    let thumbnail: String?
    let secureThumbnail: String?
    let pictures: [Picture]?
    let videoId: String?
    let descriptions: [String]?
    let acceptsMercadoPago: Bool?
    let nonMercadoPagoPaymentMethods: [String]?
    let shipping: DetailShipping?
    let internationalDeliveryMode: String?
    let sellerAddress: ProductDetailSellerAddress?
    let sellerContact: String?
    let location: Location?
    let coverageAreas: [String]?
    let attributes: [Attribute]?
    let warnings: [String]?
    let listingSource: String?
    let variations: [Variation]?
    let status: String?
    let subStatus: [String]?
    let tags: [String]?
    let warranty: String?
    let catalogProductId: String?
    let domainId: String?
    let parentItemId: String?
    let differentialPricing: String?
    let dealIds: [String]?
    let automaticRelist: Bool?
    let dateCreated: String?
    let lastUpdated: String?
    let health: Double?
    let catalogListing: Bool?
    let channels: [String]?

    enum CodingKeys: String, CodingKey {
        case productId = "id"
        case siteId = "site_id"
        case title
        case subtitle
        case sellerId = "seller_id"
        case categoryId = "category_id"
        case officialStoreId = "official_store_id"
        case price
        case basePrice = "base_price"
        case originalPrice = "original_price"
        case currencyId = "currency_id"
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case buyingMode = "buying_mode"
        case listingTypeId = "listing_type_id"
        case startTime = "start_time"
        case stopTime = "stop_time"
        case condition
        case permalink
        case thumbnailId = "thumbnail_id"
        case thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
        case videoId = "video_id"
        case descriptions
        case acceptsMercadoPago = "accepts_mercadopago"
        case nonMercadoPagoPaymentMethods
        case shipping
        case internationalDeliveryMode = "international_delivery_mode"
        case sellerAddress = "seller_address"
        case sellerContact = "seller_contact"
        case location
        case coverageAreas = "coverage_areas"
        case attributes
        case warnings
        case listingSource = "listing_source"
        case variations
        case status
        case subStatus = "sub_status"
        case tags
        case warranty
        case catalogProductId = "catalog_product_id"
        case domainId = "domain_id"
        case parentItemId = "parent_item_id"
        case differentialPricing = "differential_pricing"
        case dealIds = "deal_ids"
        case automaticRelist = "automatic_relist"
        case dateCreated = "date_created"
        case lastUpdated = "last_updated"
        case health
        case catalogListing = "catalog_listing"
        case channels
    }
}
