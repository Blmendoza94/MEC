import RxSwift
import XCTest

@testable import MEC

class ProductDetailDataSourceTests: XCTestCase {
    var dataSource: ProductDetailDataSource?
    var viewMock: ProductDetailView?

    var viewData = ProductDetailViewData(
        productId: "123",
        imageURL: .none,
        productName: "auto",
        productPrice: "$5000"
    )

    override func setUp() {
        super.setUp()

        viewMock = ProductDetailViewMock()
        viewMock?.viewData = viewData

        if let viewMock = viewMock {
            dataSource = ProductDetailDataSource()
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
        XCTAssertEqual(numberOfRows, ProductDetailCellType.types.count)
    }

    func testCellForRowAt() {
        let tableView = UITableView()
        tableView.register(with: HeaderCell.self)
        guard let cell = dataSource?.tableView(
            tableView,
            cellForRowAt: IndexPath(row: .zero, section: .zero)
        ) as? HeaderCell else {
            XCTFail("Cell type error!!!")
            return
        }

        let productName = cell.viewData?.productName
        let productPrice = cell.viewData?.productPrice
        let productURL = cell.viewData?.imageURL

        XCTAssertEqual(productName, viewData.productName)
        XCTAssertEqual(productPrice, viewData.productPrice)
        XCTAssertEqual(productURL, viewData.imageURL)
    }
}
