import Foundation

struct Sort: Codable {
    let sortId: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case sortId = "id"
        case name
    }
}
