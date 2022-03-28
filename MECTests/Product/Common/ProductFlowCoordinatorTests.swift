import RxSwift
import XCTest

@testable import MEC

class ProductFlowCoordinatorTests: XCTestCase {
    var coordinator: ProductCoordinator?
    var navigationController: UINavigationController?

    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        coordinator = ProductFlowCoordinator(
            navigationController: navigationController ?? .init()
        )
    }

    override func tearDown() {
        super.tearDown()
        coordinator = .none
        navigationController = .none
    }

    func testGotoProductList() {
        coordinator?.goToProductList(.empty)
        guard let firstVC = navigationController?
            .viewControllers.first as? ProductListViewController
        else {
            XCTFail("Push VC fail!!!")
            return
        }

        XCTAssertNotNil(firstVC)
    }

    func testGotoProductDetail() {
        coordinator?.goToProductDetail(.empty)
        guard let firstVC = navigationController?
            .viewControllers.first as? ProductDetailViewController
        else {
            XCTFail("Push VC fail!!!")
            return
        }

        XCTAssertNotNil(firstVC)
    }

    func testClose() {
        coordinator?.close()
        guard let isEmpty = navigationController?
            .viewControllers.isEmpty, isEmpty
        else {
            XCTFail("Push VC fail!!!")
            return
        }

        XCTAssertTrue(isEmpty)
    }
}
