import Foundation

struct Value: Codable {
    let name: String?
    let structValue: ValueStruct?
    let source: Int?
    let valueId: String?

    enum CodingKeys: String, CodingKey {
        case name
        case structValue = "struct"
        case source
        case valueId = "id"
    }
}
