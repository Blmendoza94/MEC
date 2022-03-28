import RxSwift
import XCTest

@testable import MEC

class ProductListViewModelTests: XCTestCase {
    var viewModel: ProductListViewModel?
    var session: SessionMock?

    var listData: Data? {
        return getDataFromJson(fileName: "getProductList")
    }

    override func setUp() {
        super.setUp()

        session = SessionMock()

        if let session = session {
            let repository = ProductListRestApi(session: session)
            viewModel = ProductListViewModel(repository: repository)
        }
    }

    override func tearDown() {
        super.tearDown()
        viewModel = .none
        session = .none
    }

    func testSuccessGetProductDetail() {
        session?.data = listData
        session?.error = .none
        session?.response = .none

        let disposeBag = DisposeBag()

        let exp = expectation(description: "List is not Empty")
        viewModel?.getProductList(.empty).subscribe { viewDataList in
            XCTAssertFalse(viewDataList?.isEmpty ?? true)
            let firstViewData = viewDataList?.first
            XCTAssertEqual(
                firstViewData?.productId ?? .empty,
                "MLC433681660"
            )
            XCTAssertEqual(
                firstViewData?.productName ?? .empty,
                "Pollos Silkies O Sedosos Del Japón."
            )
            exp.fulfill()
        } onError: { error in
            XCTFail(error.localizedDescription)
        }.disposed(by: disposeBag)
        waitForExpectations(timeout: 0.1, handler: .none)
    }

    func testFailGetProductDetail() {
        session?.error = NSError(domain: .empty, code: .zero, userInfo: .none)

        let disposeBag = DisposeBag()

        let exp = expectation(description: .empty)
        viewModel?.getProductList(.empty).subscribe { _ in
            XCTFail()
            exp.fulfill()
        } onError: { error in
            XCTAssertNotNil(error)
            exp.fulfill()
        }.disposed(by: disposeBag)
        waitForExpectations(timeout: 0.1, handler: .none)
    }
}
