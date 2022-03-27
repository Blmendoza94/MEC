import Foundation

struct ProductInformation: Codable {
    let siteId: String?
    let countryDefaultTimeZone: String?
    let query: String?
    let paging: Paging?
    let results: [Product?]?
    let sort: Sort?
    let availableSorts: [Sort?]?
    let filters: [FilterValue?]?
    let availableFilters: [FilterValue?]?

    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case countryDefaultTimeZone = "country_default_time_zone"
        case query
        case paging
        case results
        case sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
}
