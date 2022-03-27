import Foundation

struct Paging: Codable {
    let total: Int?
    let primaryResults: Int
    let offset: Int
    let limit: Int

    enum CodingKeys: String, CodingKey {
        case total = "site_id"
        case primaryResults = "primary_results"
        case offset
        case limit
    }
}
