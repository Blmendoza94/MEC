import UIKit

class SearchProductDelegate: NSObject {
    private weak var view: SearchProductView?

    func attach(_ view: SearchProductView) {
        self.view = view
    }
}

extension SearchProductDelegate: SearchCellDelegate {
    func searchItem(_ searchText: String) {
        view?.showProductList(searchText)
    }
}

extension SearchProductDelegate: UITableViewDelegate {
    func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt _: IndexPath) {
        let cell = cell as? SearchCell
        cell?.delegate = self
    }
}
