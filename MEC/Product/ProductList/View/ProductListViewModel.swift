import RxSwift

class ProductListViewModel {
    private let repository = ProductListRestApi()

    var coordinator: ProductCoordinator?
}

extension ProductListViewModel: ProductListViewModelProtocol {
    func getProductList(_ searchText: String) -> Observable<[ProductViewData]?> {
        return Observable.create { observer in
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
        coordinator?.goToProductDetail(productId)
    }
}
