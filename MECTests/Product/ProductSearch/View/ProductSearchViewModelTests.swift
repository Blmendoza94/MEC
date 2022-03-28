import RxSwift
import XCTest

@testable import MEC

class ProductSearchViewModelTests: XCTestCase {
    var viewModel: ProductSearchViewModel?
    var coordinator: ProductCoordinatorMock?

    override func setUp() {
        super.setUp()

        coordinator = ProductCoordinatorMock()
        viewModel = ProductSearchViewModel()
        viewModel?.coordinator = coordinator
    }

    override func tearDown() {
        super.tearDown()
        viewModel = .none
        coordinator = .none
    }

    func testSuccesShowProductSearch() {
        viewModel?.showProductSearch(.empty)
        XCTAssertTrue(coordinator?.goToProductListCalled ?? false)
    }
}
