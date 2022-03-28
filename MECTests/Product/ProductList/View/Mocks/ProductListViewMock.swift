@testable import MEC
import UIKit

class ProductListViewMock: BaseViewController {
    var searchText: String?
    var viewDataList: [ProductViewData]?

    var showProductDetailCalled = false
}

extension ProductListViewMock: ProductListView {
    func showProductDetail(_: String) {
        showProductDetailCalled = true
    }
}
