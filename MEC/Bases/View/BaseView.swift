import UIKit

protocol BaseView: AnyObject {
    var activityIndicatorView: UIActivityIndicatorView? { get set }
    var viewModel: ViewModel? { get set }

    func showLoading()
    func stopLoading()
    func removeBackButtonTitleWhenPushed()
    func showGenericError(
        _ actions: [UIAlertAction],
        title: String,
        message: String
    )
}
