import UIKit

class ProductSearchDelegate: NSObject {
    private weak var view: ProductSearchView?

    func attach(_ view: ProductSearchView) {
        self.view = view
    }
}

extension ProductSearchDelegate: SearchCellDelegate {
    func searchItem(_ searchText: String) {
        view?.showProductList(searchText)
    }
}

extension ProductSearchDelegate: UITableViewDelegate {
    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt _: IndexPath) {
        let cell = cell as? SearchCell
        cell?.delegate = self
    }
}
