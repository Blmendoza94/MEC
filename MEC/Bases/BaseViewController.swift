import UIKit

class BaseViewController: UIViewController {
    var activityIndicatorView: UIActivityIndicatorView? {
        didSet {
            view.addAutoLayout(subview: activityIndicatorView ?? UIView())
            activityIndicatorView?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            activityIndicatorView?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func showLoading() {
        activityIndicatorView = UIActivityIndicatorView(frame: .zero)
        activityIndicatorView?.startAnimating()
    }

    func stopLoading() {
        activityIndicatorView?.stopAnimating()
        activityIndicatorView?.removeFromSuperview()
    }
}
