import Foundation

struct Picture: Codable {
    let pictureId: String?
    let url: String?
    let secureUrl: String?
    let size: String?
    let maxSize: String?
    let quality: String?

    enum CodingKeys: String, CodingKey {
        case pictureId = "id"
        case url
        case secureUrl = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}
