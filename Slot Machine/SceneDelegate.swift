import UIKit
import SwiftUI

@available(iOS 15.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

//    var globalVariable: GlobalVariables = GlobalVariables()
    
    var view: some View = MenuView(global: GlobalVariables())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        // Fixed-sized app window for mac
        if let scene = scene as? UIWindowScene {
            scene.sizeRestrictions?.minimumSize = CGSize.init(width: 600, height: 800)
            scene.sizeRestrictions?.maximumSize = CGSize.init(width: 600, height: 800)
        }

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: view)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

