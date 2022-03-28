import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var baseCoordinator: Coordinator?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let navigationController = UINavigationController()

        baseCoordinator = ProductFlowCoordinator(navigationController: navigationController)
        baseCoordinator?.show()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}
