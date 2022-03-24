import Foundation

struct Indicator: Codable {
    let code: String?
    let name: String?
    let measurementUnit: String?
    let date: String?
    let value: Double?

    enum CodingKeys: String, CodingKey {
        case code = "codigo"
        case name = "nombre"
        case measurementUnit = "unidad_medida"
        case date = "fecha"
        case value = "valor"
    }
}
