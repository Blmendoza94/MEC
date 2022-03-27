import Foundation

struct Rule: Codable {
    let defaultValue: Bool?
    let freeMode: String?
    let freeShippingFlag: Bool?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case defaultValue = "default"
        case freeMode = "free_mode"
        case freeShippingFlag = "free_shipping_flag"
        case value
    }
}
