import RxSwift
import UIKit

class ProductListViewController: BaseViewController {
    private let tableView = UITableView(frame: .zero)
    private let dataSource = ProductListDataSource()
    private let delegate = ProductListDelegate()
    private let disposeBag = DisposeBag()

    var searchText: String?
    var viewModel: ProductListViewModelProtocol?
    var viewDataList: [ProductViewData]?

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.attach(self)
        delegate.attach(self)

        prepare()
        getProductList()
    }

    private func prepare() {
        title = ProductListConstants.ViewController.title
        prepareTableView()
        registerCells()
    }

    private func prepareTableView() {
        view.addAutoLayout(tableView)

        tableView.dataSource = dataSource
        tableView.delegate = delegate

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func registerCells() {
        tableView.register(with: UITableViewCell.self)
        tableView.register(with: ProductCell.self)
    }

    private func getProductList() {
        guard let viewModel = viewModel else {
            return
        }

        showLoading()

        return viewModel.getProductList(searchText ?? .empty)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewDataList in
                self?.stopLoading()
                guard let isEmpty = viewDataList?.isEmpty, !isEmpty else {
                    self?.showEmptyListError()
                    return
                }
                self?.viewDataList = viewDataList
                self?.tableView.reloadData()
            } onError: { [weak self] _ in
                self?.showError()
            }.disposed(by: disposeBag)
    }

    private func showError() {
        let action = UIAlertAction(
            title: ProductConstants.Error.primaryActionTitle,
            style: .default
        ) { [weak self] _ in
            self?.getProductList()
        }

        let secondaryAction = UIAlertAction(
            title: ProductConstants.Error.secondaryActionTitle,
            style: .default,
            handler: .none
        )

        showGenericError(
            [action, secondaryAction],
            title: ProductConstants.Error.title,
            message: ProductDetailConstants.Error.message
        )
    }

    private func showEmptyListError() {
        let action = UIAlertAction(
            title: ProductListConstants.EmptyError.actionTitle,
            style: .default
        ) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }

        showGenericError(
            [action],
            title: ProductListConstants.EmptyError.title,
            message: ProductListConstants.EmptyError.message
        )
    }
}

extension ProductListViewController: ProductListView {
    func showProductDetail(_ productId: String) {
        viewModel?.showProductDetail(productId)
    }
}
