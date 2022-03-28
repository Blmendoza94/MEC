import UIKit

class ProductListDelegate: NSObject {
    private weak var view: ProductListView?

    func attach(_ view: ProductListView) {
        self.view = view
    }
}

extension ProductListDelegate: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let viewData = view?.viewDataList?[indexPath.row],
            let productId = viewData.productId else { return }

        view?.showProductDetail(productId)
    }
}
