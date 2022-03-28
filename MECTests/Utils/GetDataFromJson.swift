import Foundation
@testable import MEC

func getDataFromJson(fileName: String) -> Data? {
    return FileUtil.shared
        .obtainDataFromJson(fileName: fileName)
}
