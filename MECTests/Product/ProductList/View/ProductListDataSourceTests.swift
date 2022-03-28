import RxSwift
import XCTest

@testable import MEC

class ProductListDataSourceTests: XCTestCase {
    var dataSource: ProductListDataSource?
    var viewMock: ProductListView?

    var viewDataList = [
        ProductViewData(
            productId: "123",
            productImageURL: .none,
            productName: "juegos",
            productPrice: "$2000"
        ),
        ProductViewData(
            productId: "456",
            productImageURL: .none,
            productName: "lentes",
            productPrice: "$3000"
        ),
    ]

    override func setUp() {
        super.setUp()

        viewMock = ProductListViewMock()
        viewMock?.viewDataList = viewDataList

        if let viewMock = viewMock {
            dataSource = ProductListDataSource()
            dataSource?.attach(viewMock)
        }
    }

    override func tearDown() {
        super.tearDown()
        viewMock = .none
        dataSource = .none
    }

    func testNumberOfRowsInSection() {
        let numberOfRows = dataSource?.tableView(
            UITableView(),
            numberOfRowsInSection: .zero
        )
        XCTAssertEqual(numberOfRows, viewDataList.count)
    }

    func testCellForRowAt() {
        let tableView = UITableView()
        tableView.register(with: ProductCell.self)
        for row in .zero ..< viewDataList.count {
            guard let cell = dataSource?.tableView(
                tableView,
                cellForRowAt: IndexPath(row: row, section: .zero)
            ) as? ProductCell else {
                XCTFail("Cell type error!!!")
                return
            }
            let viewData = viewDataList[row]

            let productName = cell.viewData?.productName
            let productPrice = cell.viewData?.productPrice
            let productURL = cell.viewData?.productImageURL

            XCTAssertEqual(productName, viewData.productName)
            XCTAssertEqual(productPrice, viewData.productPrice)
            XCTAssertEqual(productURL, viewData.productImageURL)
        }
    }
}
