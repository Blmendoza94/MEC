import UIKit

protocol ProductDetailView: BaseView {
    var productId: String? { get set }

    var viewData: ProductDetailViewData? { get set }
    var viewModel: ProductDetailViewModelProtocol? { get set }
}
