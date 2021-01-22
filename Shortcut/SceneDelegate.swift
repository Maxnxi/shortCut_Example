//
//  SceneDelegate.swift
//  Shortcut
//
//  Created by Maksim on 21.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    
    var vcsArray = [UIViewController]()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mountainVC = storyboard.instantiateViewController(withIdentifier: "mountainVC") as! MountainVC
        let spaceVC = storyboard.instantiateViewController(withIdentifier: "spaceVC") as! SpaceVC
        let oceanVC = storyboard.instantiateViewController(withIdentifier: "oceanVC") as! OceanVC
        
        vcsArray = [mountainVC, spaceVC, oceanVC]
       
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    // shortcut
    
    enum ShortcutType : String {
        case mountain = "mountain"
        case space = "space"
        case ocean = "ocean"
    }
    
    
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        //print(shortcutItem.type)
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVc = window?.rootViewController as! UINavigationController
            navVc.setViewControllers(vcsArray, animated: false)
            
            switch type {
            
            case ShortcutType.space.rawValue:
                print("This is the space")
                navVc.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
            case ShortcutType.ocean.rawValue:
                print("Love the beach")
                navVc.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
            default:
                navVc.popToRootViewController(animated: true)
                print("These are the mountains")
                completionHandler(true)
            }
        }
        completionHandler(false)
    }
//
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

