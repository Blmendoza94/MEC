import Foundation

struct Shipping: Codable {
    let freeShipping: Bool?
    let mode: String?
    let tags: [String?]?
    let logisticType: String?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode = "country_default_time_zone"
        case tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}
