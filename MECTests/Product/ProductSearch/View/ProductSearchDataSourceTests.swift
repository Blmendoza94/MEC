import RxSwift
import XCTest

@testable import MEC

class ProductSearchDataSourceTests: XCTestCase {
    var dataSource: ProductSearchDataSource?

    override func setUp() {
        super.setUp()
        dataSource = ProductSearchDataSource()
    }

    override func tearDown() {
        super.tearDown()
        dataSource = .none
    }

    func testNumberOfRowsInSection() {
        let tableView = UITableView()
        let numberOfRows = dataSource?.tableView(
            tableView,
            numberOfRowsInSection: .zero
        )
        XCTAssertEqual(numberOfRows, ProductSearchCellType.types.count)
    }

    func testCellForRowAt() {
        let tableView = UITableView()
        tableView.register(with: SearchCell.self)
        guard let cell = dataSource?.tableView(
            tableView,
            cellForRowAt: IndexPath(row: .zero, section: .zero)
        ) as? SearchCell else {
            XCTFail("Cell type error!!!")
            return
        }
        XCTAssertNotNil(cell)
    }
}
