import Foundation

struct Place: Codable {
    let placeId: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case placeId = "id"
        case name
    }
}
