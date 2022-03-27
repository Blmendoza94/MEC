import Foundation

struct Filter: Codable {
    let id: String?
    let name: String?
    let type: String?
    let values: [FilterValue?]?
}
