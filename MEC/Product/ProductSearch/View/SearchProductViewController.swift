import UIKit

class SearchProductViewController: BaseViewController {
    private let tableView = UITableView(frame: .zero)

    private let dataSource = SearchProductDataSource()
    private let delegate = SearchProductDelegate()

    var viewModel: SearchProductViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.attach(self)
        delegate.attach(self)
        prepare()
    }

    private func prepare() {
        title = ProductSearchConstants.ViewController.title
        prepareTableView()
        registerCells()
    }

    private func prepareTableView() {
        view.addAutoLayout(tableView)

        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.separatorStyle = .none

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func registerCells() {
        tableView.register(with: UITableViewCell.self)
        tableView.register(with: SearchCell.self)
    }
}

extension SearchProductViewController: SearchProductView {
    func showProductList(_ searchText: String) {
        viewModel?.showProductSearch(searchText)
    }
}
