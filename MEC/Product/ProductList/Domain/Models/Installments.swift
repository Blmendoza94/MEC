import Foundation

struct Installments: Codable {
    let quantity: Int?
    let amount: Double?
    let rate: Int?
    let currencyId: String?

    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
        case currencyId = "currency_id"
    }
}
