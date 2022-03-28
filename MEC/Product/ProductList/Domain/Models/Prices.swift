import Foundation

struct Prices: Codable {
    let pricesId: String?
    let prices: [Price?]?
    let presentation: Presentation?
    let paymentMethodPrices: [Int?]?
    let referencePrices: [ReferencePrice?]?
    let purchaseDiscounts: [Int?]?

    enum CodingKeys: String, CodingKey {
        case pricesId = "id"
        case prices
        case presentation
        case paymentMethodPrices = "payment_method_prices"
        case referencePrices = "reference_prices"
        case purchaseDiscounts = "purchase_discounts"
    }
}
