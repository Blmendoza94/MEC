import Foundation

struct DetailShipping: Codable {
    let mode: String?
    let freeMethods: [FreeMethods]?
    let tags: [String]?
    let dimensions: String?
    let localPickUp: Bool?
    let freeShipping: Bool?
    let logisticType: String?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case mode
        case freeMethods = "free_methods"
        case tags
        case dimensions
        case localPickUp = "local_pick_up"
        case freeShipping = "free_shipping"
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}
