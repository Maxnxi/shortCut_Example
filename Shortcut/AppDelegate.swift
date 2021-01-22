//
//  AppDelegate.swift
//  Shortcut
//
//  Created by Maksim on 21.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vcsArray = [UIViewController]()
    
    
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mountainVC = storyboard.instantiateViewController(withIdentifier: "mountainVC") as! MountainVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: "spaceVC") as! SpaceVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: "oceanVC") as! OceanVC
        
        vcsArray = [mountainVC, spaceVC, oceanVC]
        
        return true
    }
    
    enum ShortcutType : String {
        case mountain = "mountain"
        case space = "space"
        case ocean = "ocean"
    }
    
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        //print(shortcutItem.type)
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVc = window?.rootViewController as! UINavigationController
            navVc.setViewControllers(vcsArray, animated: false)
            
            switch type {
            
            case ShortcutType.space.rawValue:
                print("This is the space")
                navVc.popToViewController(vcsArray[1], animated: false)
            case ShortcutType.ocean.rawValue:
                print("Love the beach")
            default:
                print("These are the mountains")
            }
        }
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

