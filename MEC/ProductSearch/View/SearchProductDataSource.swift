import Foundation
import UIKit

class SearchProductDataSource: NSObject {
    weak var view: SearchProductView?

    func attach(view: SearchProductView) {
        self.view = view
    }

    private func prepareSearchInputCell(
        _ tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        return tableView.dequeueReusableCell(
            with: SearchCell.self,
            for: indexPath
        )
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
