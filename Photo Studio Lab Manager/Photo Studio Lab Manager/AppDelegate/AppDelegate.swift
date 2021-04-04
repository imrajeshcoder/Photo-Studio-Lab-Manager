//
//  AppDelegate.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 27/02/21.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift
import FAPanels
@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        
        if isLogin
        {
            AppDelegate.navigateToMain()
        }
        else
        {
            AppDelegate.navigateToAuth()
        }
        
        
        // Override point for customization after application launch.
        return true
    }
    
    
    static func navigateToAuth(){
        
        let story = UIStoryboard(name: "Auth", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "AuthNavigationController")
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
    static func navigateToMain(){
      
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let leftMenuVC: PSLMLeftMenuVC = mainStoryboard.instantiateViewController(withIdentifier: "PSLMLeftMenuVC") as! PSLMLeftMenuVC
        let centerVC: PSLMCenterVC = mainStoryboard.instantiateViewController(withIdentifier: "PSLMCenterVC") as! PSLMCenterVC
        let centerNavVC = UINavigationController(rootViewController: centerVC)

        //  Set the Panel controllers with just two lines of code
        let rootController = FAPanelController()
        rootController.center(centerNavVC).left(leftMenuVC)
        UIApplication.shared.windows.first?.rootViewController = rootController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension UIViewController {
       var appDelegate: AppDelegate {
       return UIApplication.shared.delegate as! AppDelegate
   }
   
   var sceneDelegate: SceneDelegate? {
       guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate else { return nil }
        return delegate
   }
}

extension UIViewController {
   var window: UIWindow? {
       if #available(iOS 13, *) {
           guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let delegate = windowScene.delegate as? SceneDelegate, let window = delegate.window else { return nil }
                  return window
       }
       
       guard let delegate = UIApplication.shared.delegate as? AppDelegate, let window = delegate.window else { return nil }
       return window
   }
}

