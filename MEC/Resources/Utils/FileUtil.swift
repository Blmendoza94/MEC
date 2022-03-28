import Foundation

class FileUtil {
    static let shared = FileUtil()

    private init() {}

    func obtainPropertyFileDictionary(
        resource: String,
        withExtension: String
    ) -> [String: Any]? {
        let propertyFileDictionary = [String: Any]()

        if let infoPlistPath = Bundle.main.url(
            forResource: resource,
            withExtension: withExtension
        ) {
            do {
                let infoPlistData = try Data(contentsOf: infoPlistPath)

                if let data = try PropertyListSerialization.propertyList(
                    from: infoPlistData,
                    options: [],
                    format: .none
                ) as? [String: Any] {
                    return data
                }

            } catch {
                return propertyFileDictionary
            }
        }
        return propertyFileDictionary
    }

    func obtainDataFromJson(fileName: String) -> Data? {
        guard let urlPath = Bundle.main
            .url(forResource: fileName, withExtension: .json) else { return .none }

        var dataFromJson: Data?

        do {
            dataFromJson = try Data(contentsOf: urlPath, options: .mappedIfSafe)
        } catch {
            dataFromJson = .none
        }

        return dataFromJson
    }
}
