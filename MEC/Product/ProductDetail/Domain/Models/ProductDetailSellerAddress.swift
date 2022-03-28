import Foundation
struct ProductDetailSellerAddress: Codable {
    let city: Place?
    let state: Place?
    let country: Place?
    let searchLocation: SearchLocation?
    let sellerAddressId: Int?

    enum CodingKeys: String, CodingKey {
        case city
        case state
        case country
        case searchLocation = "search_location"
        case sellerAddressId = "id"
    }
}
