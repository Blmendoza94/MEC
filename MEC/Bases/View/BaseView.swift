import UIKit

protocol BaseView: AnyObject {
    var activityIndicatorView: UIActivityIndicatorView? { get set }

    func showLoading()
    func stopLoading()
    func removeBackButtonTitleWhenPushed()
    func showGenericError(
        _ actions: [UIAlertAction],
        title: String,
        message: String
    )
}
