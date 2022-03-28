import Foundation

struct ProductDetailValue: Codable {
    let valueId: String?
    let name: String?
    let valueStruct: ValueStruct?

    enum CodingKeys: String, CodingKey {
        case valueId = "id"
        case name
        case valueStruct = "struct"
    }
}
