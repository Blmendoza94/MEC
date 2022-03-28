import RxSwift

class ProductDetailViewModel: BaseViewModel {
    private var repository: ProductDetailRepository

    private var productCoordinator: ProductCoordinator? {
        return coordinator as? ProductCoordinator
    }

    init(repository: ProductDetailRepository) {
        self.repository = repository
    }
}

extension ProductDetailViewModel: ProductDetailViewModelProtocol {
    func getProductDetail(_ productId: String) -> Observable<ProductDetailViewData?> {
        return Observable.create { observer in
            self.repository.getProductDetail(productId).subscribe { detailList in
                let productDetail = detailList.first?.body
                let viewData = ProductDetailViewData(
                    productId: productDetail?.productId ?? .empty,
                    imageURL: URL(string: productDetail?.pictures?.first?.url ?? .empty),
                    productName: productDetail?.title ?? .empty,
                    productPrice: productDetail?.price?.toCLP ?? .empty
                )
                observer.onNext(viewData)
            } onError: { error in
                observer.onError(error)
            }
        }
    }

    func closeView() {
        productCoordinator?.close()
    }
}
