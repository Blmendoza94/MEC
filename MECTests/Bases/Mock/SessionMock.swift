import Foundation
@testable import MEC

class SessionMock: NetworkSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func loadData(
        with _: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        completionHandler(data, response, error)
    }

    func finishTasksAndInvalidate() {
        data = .none
        response = .none
        error = .none
    }
}
