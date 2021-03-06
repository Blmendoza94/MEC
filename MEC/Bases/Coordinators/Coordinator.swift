import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator]? { get set }
    var navigationController: UINavigationController { get set }

    func show()
    func close()
}
