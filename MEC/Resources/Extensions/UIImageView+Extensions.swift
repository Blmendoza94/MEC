import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(url: URL) {
        kf.setImage(
            with: ImageResource(downloadURL: url),
            placeholder: .none,
            options: .none, progressBlock: .none,
            completionHandler: .none
        )
    }
}
