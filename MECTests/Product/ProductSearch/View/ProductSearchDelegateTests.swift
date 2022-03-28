import RxSwift
import XCTest

@testable import MEC

class ProductSearchDelegateTests: XCTestCase {
    var delegate: ProductSearchDelegate?
    var viewMock: ProductSearchViewMock?

    override func setUp() {
        super.setUp()

        viewMock = ProductSearchViewMock()

        if let viewMock = viewMock {
            delegate = ProductSearchDelegate()
            delegate?.attach(viewMock)
        }
    }

    override func tearDown() {
        super.tearDown()
        viewMock = .none
        delegate = .none
    }

    func testSearchItem() {
        delegate?.searchItem(.empty)
        XCTAssertTrue(viewMock?.showProductListCalled ?? false)
    }

    func testWillDisplay() {
        let searchCell = SearchCell(frame: .zero)
        delegate?.tableView(
            UITableView(),
            willDisplay: searchCell,
            forRowAt: IndexPath(row: .zero, section: .zero)
        )
        XCTAssertNotNil(searchCell.delegate)
    }
}
