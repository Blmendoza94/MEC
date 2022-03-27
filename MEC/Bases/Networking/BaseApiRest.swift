import CloudKit
import Foundation
import RxSwift

class BaseApiRest<O: Codable>: ApiRest {
    func get(_ url: URL) -> Observable<O> {
        var request = URLRequest(url: url)

        request.httpMethod = NetworkingConstants.Method.get

        return execute(request)
    }

    private func execute(_ request: URLRequest) -> Observable<O> {
        return Observable.create { observer in
            let session = URLSession.shared

            session.dataTask(with: request) { data, _, error in

                guard let data = data, error == nil else {
                    observer.onError(error.unsafelyUnwrapped)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let detailList = try decoder.decode(O.self, from: data)
                    observer.onNext(detailList)
                } catch {
                    observer.onError(error)
                }
            }.resume()

            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}
