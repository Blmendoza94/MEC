import UIKit

class BaseViewController: UIViewController {
    var activityIndicatorView: UIActivityIndicatorView? {
        didSet {
            view.addAutoLayout(activityIndicatorView ?? UIView())
            activityIndicatorView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            activityIndicatorView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }

    var viewModel: ViewModel?

    convenience init(_ viewModel: ViewModel?) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        removeBackButtonTitleWhenPushed()
    }
}

extension BaseViewController: BaseView {
    func showLoading() {
        activityIndicatorView = UIActivityIndicatorView(frame: .zero)
        activityIndicatorView?.startAnimating()
    }

    func stopLoading() {
        activityIndicatorView?.stopAnimating()
        activityIndicatorView?.removeFromSuperview()
    }

    func removeBackButtonTitleWhenPushed() {
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: .empty, style: .plain, target: .none, action: .none
        )
    }

    func showGenericError(
        _ actions: [UIAlertAction],
        title: String,
        message: String
    ) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        actions.forEach { action in
            alertController.addAction(action)
        }

        present(alertController, animated: true, completion: .none)
    }
}
