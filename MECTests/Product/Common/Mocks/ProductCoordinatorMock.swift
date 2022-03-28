import UIKit

@testable import MEC

class ProductCoordinatorMock {
    var parentCoordinator: Coordinator?
    var children: [Coordinator]?
    var navigationController: UINavigationController = .init()

    var goToProductListCalled = false
    var goToProductDetailCalled = false
    var showCalled = false
    var closeCalled = false
}

extension ProductCoordinatorMock: ProductCoordinator {
    func close() {
        closeCalled = true
    }

    func goToProductList(_: String) {
        goToProductListCalled = true
    }

    func goToProductDetail(_: String) {
        goToProductDetailCalled = true
    }

    func show() {
        showCalled = true
    }
}
