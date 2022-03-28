import Foundation

struct Attribute: Codable {
    let attributeId: String?
    let name: String?
    let valueId: String?
    let valueName: String?
    let valueStruct: ValueStruct?
    let attributeGroupName: String?
    let values: [ProductDetailValue?]?
    let attributeGroupId: String?

    enum CodingKeys: String, CodingKey {
        case attributeId = "id"
        case name
        case valueId = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case attributeGroupName = "attribute_group_name"
        case values
        case attributeGroupId = "attribute_group_id"
    }
}
