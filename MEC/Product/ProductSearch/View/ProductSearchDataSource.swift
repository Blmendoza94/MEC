import Foundation
import UIKit

class ProductSearchDataSource: NSObject {
    weak var view: ProductSearchView?

    func attach(_ view: ProductSearchView) {
        self.view = view
    }

    private func prepareSearchInputCell(
        _ tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            with: SearchCell.self,
            for: indexPath
        )

        cell.viewData = SearchCellViewData(
            placeHolder: ProductSearchConstants.SearchCell.placeholder,
            buttonTitle: ProductSearchConstants.SearchCell.buttonTitle
        )

        return cell
    }
}

extension ProductSearchDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return ProductSearchCellType.types.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return prepareSearchInputCell(tableView, indexPath: indexPath)
    }
}
