import RxSwift
import UIKit

class SearchProductViewModel {
    private let indicatorRepository = SearchProductRestApi()

//    func getIndicatorList() -> Observable<[IndicatorViewData]> {
//        return Observable.create { observer in
//            self.indicatorRepository.getIndicatorList()
//                .subscribe { indicatorList in
//                    var viewDataList = [IndicatorViewData]()
//                    let mirror = Mirror(reflecting: indicatorList)
//                    var childrens = mirror.children
//                    _ = childrens.popFirst()
//                    _ = childrens.popFirst()
//                    _ = childrens.popFirst()
//                    childrens.forEach { child in
//                        let indicator = child.value as? Indicator
//                        viewDataList.append(
//                            IndicatorViewData(
//                                name: indicator?.name ?? .empty,
//                                value: String(indicator?.value ?? .zero)
//                            )
//                        )
//                    }
//                    observer.onNext(viewDataList)
//                } onError: { error in
//                    observer.onError(error)
//                }
//        }
//    }
}
