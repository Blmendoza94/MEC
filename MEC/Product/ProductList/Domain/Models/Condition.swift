import Foundation

struct Condition: Codable {
    let contextRestrictions: [String?]?
    let startTime: String?
    let endTime: String?
    let eligible: Bool?

    enum CodingKeys: String, CodingKey {
        case contextRestrictions = "context_restrictions"
        case startTime = "start_time"
        case endTime = "end_time"
        case eligible
    }
}
