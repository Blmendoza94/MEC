import Foundation

struct SaleTerms: Codable {
    let saleTermsId: String?
    let name: String?
    let valueId: String?
    let valueName: String?
    let valueStruct: ValueStruct?
    let values: [ProductDetailValue]?

    enum CodingKeys: String, CodingKey {
        case saleTermsId = "id"
        case name
        case valueId = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case values
    }
}
