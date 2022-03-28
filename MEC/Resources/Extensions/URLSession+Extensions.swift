import Foundation

extension URLSession: NetworkSession {
    func loadData(
        with url: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) {
        let task = dataTask(with: url) { data, response, error in
            completionHandler(data, response, error)
        }
        task.resume()
    }
}
