import RxSwift

class ProductListViewModel: BaseViewModel {
    private let repository: ProductListRepository

    private var productCoordinator: ProductCoordinator? {
        return coordinator as? ProductCoordinator
    }

    init(repository: ProductListRepository) {
        self.repository = repository
    }
}

extension ProductListViewModel: ProductListViewModelProtocol {
    func getProductList(_ searchText: String) -> Observable<[ProductViewData]?> {
        return Observable.create { [unowned self] observer in
            self.repository.getProductList(searchText)
                .subscribe { productInformation in
                    let viewDataList = productInformation.results?.map { product in
                        ProductViewData(
                            productId: product?.productId ?? .empty,
                            productImageURL: URL(string: product?.thumbnail ?? .empty),
                            productName: product?.title,
                            productPrice: product?.price?.toCLP ?? .empty
                        )
                    }
                    observer.onNext(viewDataList)
                } onError: { error in
                    observer.onError(error)
                }
        }
    }

    func showProductDetail(_ productId: String) {
        productCoordinator?.goToProductDetail(productId)
    }

    func closeView() {
        coordinator?.close()
    }
}
