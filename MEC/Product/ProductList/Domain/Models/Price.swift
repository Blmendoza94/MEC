import Foundation

struct Price: Codable {
    let priceId: String?
    let type: String?
    let amount: Decimal?
    let regularAmount: Decimal?
    let currencyId: String?
    let lastUpdated: String?
    let conditions: Condition?
    let exchangeRateContext: String?
    let metadata: MetaData?

    enum CodingKeys: String, CodingKey {
        case priceId = "id"
        case type
        case amount
        case regularAmount = "regular_amount"
        case currencyId = "currency_id"
        case lastUpdated = "last_updated"
        case conditions
        case exchangeRateContext = "exchange_rate_context"
        case metadata
    }
}
