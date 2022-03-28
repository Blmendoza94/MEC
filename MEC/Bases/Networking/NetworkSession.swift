import Foundation

protocol NetworkSession {
    func finishTasksAndInvalidate()
    func loadData(
        with url: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    )
}
