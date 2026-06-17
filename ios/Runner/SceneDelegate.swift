import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {

    override func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        super.scene(scene, willConnectTo: session, options: connectionOptions)
        
        // After UIScene migration, some plugins (e.g. flutter_stripe 11.x) still
        // look up the presenting view controller via the deprecated path:
        // UIApplication.shared.delegate?.window??.rootViewController
        // With UIScene, the window is owned by the SceneDelegate, not the
        // AppDelegate. Bridge it so those plugins keep working.
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window = self.window
        }
    }
}
