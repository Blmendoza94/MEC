import RxSwift
class SearchProductRestApi: SearchProductRepository {
    func getProducts(category _: String) -> Observable<IndicatorList> {
        return Observable.create { observer in
            let session = URLSession.shared
            let url = URL(string: "https://mindicador.cl/api") ?? URL(fileURLWithPath: .empty)
            let request = URLRequest(url: url)

            session.dataTask(with: request) { data, _, error in

                guard let data = data, error == nil else {
                    observer.onError(error.unsafelyUnwrapped)
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let indicatorList = try decoder.decode(IndicatorList.self, from: data)
                    observer.onNext(indicatorList)
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
