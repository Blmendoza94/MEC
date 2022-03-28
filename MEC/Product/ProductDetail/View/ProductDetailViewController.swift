import RxSwift
import UIKit

class ProductDetailViewController: BaseViewController, ProductDetailView {
    private let tableView = UITableView(frame: .zero)
    private let dataSource = ProductDetailDataSource()
    private let disposeBag = DisposeBag()

    private var productDetailViewModel: ProductDetailViewModelProtocol? {
        return viewModel as? ProductDetailViewModelProtocol
    }

    var productId: String?
    var viewData: ProductDetailViewData?

    convenience init(viewModel: ProductDetailViewModelProtocol?) {
        self.init(viewModel)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource.attach(self)

        prepare()
        getProductDetail()
    }

    private func prepare() {
        title = ProductDetailConstants.ViewController.title
        prepareTableView()
        registerCells()
    }

    private func getProductDetail() {
        guard let viewModel = productDetailViewModel else {
            return
        }

        showLoading()

        return viewModel.getProductDetail(productId ?? .empty)
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewData in
                self?.stopLoading()
                self?.viewData = viewData
                self?.tableView.reloadData()
            } onError: { [weak self] _ in
                self?.stopLoading()
                self?.showError()
            }.disposed(by: disposeBag)
    }

    private func prepareTableView() {
        view.addAutoLayout(tableView)

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
        tableView.register(with: HeaderCell.self)
    }

    private func showError() {
        let primaryAction = UIAlertAction(
            title: ProductConstants.Error.primaryActionTitle,
            style: .default
        ) { [weak self] _ in
            self?.getProductDetail()
        }

        let secondaryAction = UIAlertAction(
            title: ProductConstants.Error.secondaryActionTitle,
            style: .default
        ) { [weak self] _ in
            self?.productDetailViewModel?.closeView()
        }

        showGenericError(
            [primaryAction, secondaryAction],
            title: ProductConstants.Error.title,
            message: ProductDetailConstants.Error.message
        )
    }
}
