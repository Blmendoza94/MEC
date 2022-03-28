import Foundation

struct Presentation: Codable {
    let displayCurrency: String?

    enum CodingKeys: String, CodingKey {
        case displayCurrency = "display_currency"
    }
}
