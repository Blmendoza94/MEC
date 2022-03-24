import UIKit

class SearchProductViewController: BaseViewController {
    private let tableView = UITableView(frame: .zero)
    private let dataSource = SearchProductDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.attach(view: self)
        prepare()
    }

    private func prepare() {
        prepareTableView()
        registerCells()
    }

    private func prepareTableView() {
        view.addAutoLayout(subview: tableView)

        tableView.dataSource = dataSource
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
    func showGenericError() {}
}
