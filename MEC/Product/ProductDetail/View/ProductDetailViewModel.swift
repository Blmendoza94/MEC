import RxSwift

class ProductDetailViewModel {
    private let repository = ProductDetailRestApi()
    var coordinator: ProductCoordinator?
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
}
