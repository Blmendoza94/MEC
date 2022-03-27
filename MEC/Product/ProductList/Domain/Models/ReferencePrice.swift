import Foundation

struct ReferencePrice: Codable {
    let referencePriceId: String?
    let type: String?
    let conditions: Condition?
    let amount: Int?
    let currencyId: String?
    let exchangeRateContext: String?
    let tags: [String?]?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case referencePriceId = "id"
        case type = "country_default_time_zone"
        case conditions
        case amount
        case currencyId = "currency_id"
        case exchangeRateContext = "exchange_rate_context"
        case tags = "available_sorts"
        case lastUpdated = "last_updated"
    }
}
