import UIKit

class ProductListDataSource: NSObject {
    private weak var view: ProductListView?

    func attach(_ view: ProductListView) {
        self.view = view
    }

    private func prepareProductCell(
        _ tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let productViewData = view?.viewDataList?[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            with: ProductCell.self,
            for: indexPath
        )

        cell.viewData = ProductCellViewData(
            productImageURL: productViewData?.productImageURL,
            productName: productViewData?.productName ?? .empty,
            productPrice: productViewData?.productPrice ?? .empty
        )

        return cell
    }
}

extension ProductListDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return view?.viewDataList?.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return prepareProductCell(tableView, indexPath: indexPath)
    }
}
