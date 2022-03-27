import Foundation

struct ProductDetailAttribute: Codable {
    let attributeId: String?
    let name: String?
    let valueId: String?
    let valueName: String?
    let valueStruct: String?
    let values: [ProductDetailValue]?

    enum CodingKeys: String, CodingKey {
        case attributeId = "id"
        case name
        case valueId = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case values
    }
}
