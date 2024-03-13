import UIKit
import CoreFramework
import AssetFramework
import FeatureFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .white
        debugPrint("Width : \(viewController.view.width())")
        window?.rootViewController = FeatureProxy.laodHomeViewController()
        debugPrint("Width : \(viewController.view.width())")
        window?.makeKeyAndVisible()

        return true
    }

}
