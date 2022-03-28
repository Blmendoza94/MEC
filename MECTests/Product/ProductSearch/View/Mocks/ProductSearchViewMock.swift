@testable import MEC

class ProductSearchViewMock: BaseViewController {
    var showProductListCalled = false
}

extension ProductSearchViewMock: ProductSearchView {
    func showProductList(_: String) {
        showProductListCalled = true
    }
}
