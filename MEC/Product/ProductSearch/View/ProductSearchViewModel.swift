import RxSwift
import UIKit

class ProductSearchViewModel: BaseViewModel {
    private var productCoordinator: ProductCoordinator? {
        return coordinator as? ProductCoordinator
    }
}

extension ProductSearchViewModel: ProductSearchViewModelProtocol {
    func showProductSearch(_ searchText: String) {
        productCoordinator?.goToProductList(searchText)
    }
}
