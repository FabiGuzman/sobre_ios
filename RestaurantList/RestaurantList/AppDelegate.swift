import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().tintColor = UIColor(red: 255/255.0, green: 195/255.0, blue: 50/255.0, alpha: 0.3)
        
        UIBarButtonItem.appearance().tintColor = UIColor(red: 255/255.0, green: 195/255.0, blue: 50/255.0, alpha: 1.0)
        UIToolbar.appearance().barTintColor = UIColor(red: 237/255.0, green: 240/255.0, blue: 243/255.0, alpha: 0.5)
        
        if let barFont = UIFont(name: "AvenirNextCondensed-DemiBold", size: 22.0){
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font:barFont]
        }
        
        UINavigationBar.appearance().tintColor = UIColor.black
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

