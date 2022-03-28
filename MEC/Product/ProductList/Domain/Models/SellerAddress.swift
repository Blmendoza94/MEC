import Foundation

struct SellerAddress: Codable {
    let sellerId: String?
    let comment: String?
    let addressLine: String?
    let zipCode: String?
    let country: Place?
    let state: Place?
    let city: Place?
    let latitude: String?
    let longitude: String?

    enum CodingKeys: String, CodingKey {
        case sellerId = "id"
        case comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case country
        case state
        case city
        case latitude
        case longitude
    }
}
