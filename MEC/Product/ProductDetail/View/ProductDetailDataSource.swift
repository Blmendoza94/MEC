import UIKit

class ProductDetailDataSource: NSObject {
    private weak var view: ProductDetailView?

    func attach(_ view: ProductDetailView) {
        self.view = view
    }

    private func prepareHeaderCell(
        _ tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            with: HeaderCell.self,
            for: indexPath
        )

        cell.viewData = HeaderCellViewData(
            imageURL: view?.viewData?.imageURL,
            productName: view?.viewData?.productName,
            productPrice: view?.viewData?.productPrice
        )

        return cell
    }
}

extension ProductDetailDataSource: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return ProductDetailCellType.types.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return prepareHeaderCell(tableView, indexPath: indexPath)
    }
}
