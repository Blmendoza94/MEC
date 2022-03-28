import Foundation
import RxSwift

class BaseRestApi<O: Codable>: RestApi {
    private var session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func execute(_ request: URLRequest) -> Observable<O> {
        return Observable.create { [weak self] observer in

            self?.session.loadData(with: request) { data, _, error in

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
            }

            return Disposables.create {
                self?.session.finishTasksAndInvalidate()
            }
        }
    }
}
