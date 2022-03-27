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
        let viewModel = SearchProductViewModel()

        viewModel.coordinator = self
        let searchProductViewController = SearchProductViewController(viewModel: viewModel)

        navigationController.pushViewController(searchProductViewController, animated: true)
    }

    func goToProductList(_ searchText: String) {
        let viewModel = ProductListViewModel()

        viewModel.coordinator = self

        let productListViewController = ProductListViewController(viewModel: viewModel)
        productListViewController.searchText = searchText

        navigationController.pushViewController(productListViewController, animated: true)
    }

    func goToProductDetail(_ productId: String) {
        let viewModel = ProductDetailViewModel()

        viewModel.coordinator = self

        let productDetailViewController = ProductDetailViewController(viewModel: viewModel)
        productDetailViewController.productId = productId

        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
