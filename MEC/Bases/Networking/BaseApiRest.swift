import Foundation
import RxSwift

class BaseApiRest<T: Codable>: ApiRest {
    func fetch(_ url: URL) -> Observable<T> {
        return Observable.create { observer in
            let session = URLSession.shared
            let request = URLRequest(url: url)

            session.dataTask(with: request) { data, _, error in

                guard let data = data, error == nil else {
                    observer.onError(error.unsafelyUnwrapped)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let detailList = try decoder.decode(T.self, from: data)
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
