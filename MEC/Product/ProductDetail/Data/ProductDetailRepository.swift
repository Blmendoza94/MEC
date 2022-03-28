import Foundation
import RxSwift

protocol ProductDetailRepository: AnyObject {
    func getProductDetail(_ productId: String) -> Observable<[ProductDetail]>
}
