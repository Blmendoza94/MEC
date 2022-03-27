import Foundation

struct Variation: Codable {
    let variationId: Int?
    let price: Int?
    let attributeCombinations: [ProductDetailAttribute]?
    let availableQuantity: Int?
    let soldQuantity: Int?
    let saleTerms: [String]?
    let pictureIds: [String]?
    let catalogProductId: String?

    enum CodingKeys: String, CodingKey {
        case variationId = "id"
        case price
        case attributeCombinations = "attribute_combinations"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case pictureIds = "picture_ids"
        case catalogProductId = "catalog_product_id"
    }
}
