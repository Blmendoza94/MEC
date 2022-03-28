@testable import MEC
import RxSwift
import XCTest

class ProductDetailViewModelTests: XCTestCase {
    var viewModel: ProductDetailViewModel?
    var session: SessionMock?

    var detailData: Data? {
        return getDataFromJson(fileName: "getProductDetail")
    }

    override func setUp() {
        super.setUp()

        session = SessionMock()

        if let session = session {
            let repository = ProductDetailRestApi(session: session)
            viewModel = ProductDetailViewModel(repository: repository)
        }
    }

    override func tearDown() {
        super.tearDown()
        viewModel = .none
        session = .none
    }

    func testSuccessGetProductDetail() {
        session?.data = detailData
        session?.error = .none
        session?.response = .none

        let disposeBag = DisposeBag()

        let exp = expectation(description: "Equals attributes")
        viewModel?.getProductDetail(.empty).subscribe { viewData in
            XCTAssertEqual(viewData?.productId, "MLC642385424")
            XCTAssertEqual(viewData?.productName, "Mac Cosmetics  Labial Matte Diva")
            XCTAssertEqual(viewData?.productPrice, "$11.900")
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
        viewModel?.getProductDetail(.empty).subscribe { _ in
            XCTFail()
            exp.fulfill()
        } onError: { error in
            XCTAssertNotNil(error)
            exp.fulfill()
        }.disposed(by: disposeBag)
        waitForExpectations(timeout: 0.1, handler: .none)
    }
}
