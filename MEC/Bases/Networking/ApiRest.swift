import Foundation
import RxSwift

protocol ApiRest: AnyObject {
    associatedtype GenericOutput

    func get(_ url: URL) -> GenericOutput
}
