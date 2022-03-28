import Foundation

struct FreeMethods: Codable {
    let freeMethodId: Int?
    let rule: Rule?

    enum CodingKeys: String, CodingKey {
        case freeMethodId = "id"
        case rule
    }
}
