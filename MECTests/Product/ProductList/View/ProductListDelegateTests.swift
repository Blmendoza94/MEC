import RxSwift
import XCTest

@testable import MEC

class ProductListDelegateTests: XCTestCase {
    var delegate: ProductListDelegate?
    var viewMock: ProductListViewMock?

    var viewDataList = [
        ProductViewData(
            productId: "123",
            productImageURL: .none,
            productName: "juegos",
            productPrice: "$2000"
        ),
    ]

    override func setUp() {
        super.setUp()

        viewMock = ProductListViewMock()
        viewMock?.viewDataList = viewDataList

        if let viewMock = viewMock {
            delegate = ProductListDelegate()
            delegate?.attach(viewMock)
        }
    }

    override func tearDown() {
        super.tearDown()
        viewMock = .none
        delegate = .none
    }

    func testDidSelectRowAt() {
        delegate?.tableView(
            UITableView(),
            didSelectRowAt: IndexPath(row: .zero, section: .zero)
        )
        XCTAssertTrue(viewMock?.showProductDetailCalled ?? false)
    }
}
