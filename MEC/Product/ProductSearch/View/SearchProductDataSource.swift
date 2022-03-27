import Foundation
import UIKit

class SearchProductDataSource: NSObject {
    weak var view: SearchProductView?

    func attach(_ view: SearchProductView) {
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

extension SearchProductDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return SearchProductCellType.types.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        return prepareSearchInputCell(tableView, indexPath: indexPath)
    }
}
