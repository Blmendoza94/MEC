import UIKit

class ProductFlowCoordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator]?

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension ProductFlowCoordinator: ProductCoordinator {
    func show() {
        let viewModel = ProductSearchViewModel()

        viewModel.coordinator = self
        let searchProductViewController = ProductSearchViewController(viewModel: viewModel)

        navigationController.pushViewController(searchProductViewController, animated: true)
    }

    func goToProductList(_ searchText: String) {
        let repository = ProductListRestApi()
        let viewModel = ProductListViewModel(repository: repository)

        viewModel.coordinator = self

        let productListViewController = ProductListViewController(viewModel: viewModel)
        productListViewController.searchText = searchText

        navigationController.pushViewController(productListViewController, animated: true)
    }

    func goToProductDetail(_ productId: String) {
        let repository = ProductDetailRestApi()
        let viewModel = ProductDetailViewModel(repository: repository)

        viewModel.coordinator = self

        let productDetailViewController = ProductDetailViewController(viewModel: viewModel)
        productDetailViewController.productId = productId

        navigationController.pushViewController(productDetailViewController, animated: true)
    }

    func close() {
        navigationController.popViewController(animated: true)
    }
}
