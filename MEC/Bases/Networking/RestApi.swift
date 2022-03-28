import Foundation
import RxSwift

protocol RestApi: AnyObject {
    associatedtype GenericOutput

    func execute(_ request: URLRequest) -> Observable<GenericOutput>
}
