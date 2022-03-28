import Foundation

struct FilterValue: Codable {
    let filterValueId: String?
    let name: String?
    let results: Int?

    enum CodingKeys: String, CodingKey {
        case filterValueId = "id"
        case name = "country_default_time_zone"
        case results
    }
}
