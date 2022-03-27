import Foundation

struct Seller: Codable {
    let sellerId: Int?
    let permalink: String?
    let registrationDate: String?
    let carDealer: Bool?
    let realEstateAgency: Bool?
    let tags: [String]?

    enum CodingKeys: String, CodingKey {
        case sellerId = "id"
        case permalink = "primary_results"
        case registrationDate = "registration_date"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case tags
    }
}
