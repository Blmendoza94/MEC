import RxSwift
import UIKit

class SearchProductViewModel {
    var coordinator: ProductCoordinator?
}

extension SearchProductViewModel: SearchProductViewModelProtocol {
    func showProductSearch(_ searchText: String) {
        coordinator?.goToProductList(searchText)
    }
}
