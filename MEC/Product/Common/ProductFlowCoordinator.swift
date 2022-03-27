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
        let searchProductViewController = SearchProductViewController()
        let viewModel = SearchProductViewModel()

        viewModel.coordinator = self
        searchProductViewController.viewModel = viewModel

        navigationController.pushViewController(searchProductViewController, animated: true)
    }

    func goToProductList(_ searchText: String) {
        let productListViewController = ProductListViewController()
        let viewModel = ProductListViewModel()

        viewModel.coordinator = self
        productListViewController.searchText = searchText
        productListViewController.viewModel = viewModel

        navigationController.pushViewController(productListViewController, animated: true)
    }

    func goToProductDetail(_ productId: String) {
        let productDetailViewController = ProductDetailViewController()
        let viewModel = ProductDetailViewModel()

        viewModel.coordinator = self
        productDetailViewController.viewModel = viewModel
        productDetailViewController.productId = productId

        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
