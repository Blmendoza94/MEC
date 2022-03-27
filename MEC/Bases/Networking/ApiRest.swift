import Foundation
import RxSwift

protocol ApiRest: AnyObject {
    associatedtype GenericType

    func fetch(_ url: URL) -> GenericType
}
