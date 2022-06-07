//
//  SceneDelegate.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/3/22.
//
import FirebaseAuth
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        Coordinator.window = window
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if(!appDelegate.hasAlreadyLaunched){
            // App is opened for the first time
            appDelegate.sethasAlreadyLaunched()
            
            let Onboarding : OnboardingViewController = mainStoryboard.instantiateViewController(withIdentifier: "OnboardingVC") as! OnboardingViewController
            window.rootViewController = Onboarding
            
            
        }
        else{
                    if Auth.auth().currentUser != nil {
                        
                        // Fetch user data
                        
                        
                        // Do action depending on user data
            
            
                        if UserInfo.account_type == "employee"{
            
                            let HomeEmployee : HomeEmployeeViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeEmployeeVC") as! HomeEmployeeViewController
                            window.rootViewController = HomeEmployee
            
                        }
                        else {
            
                            let HomeEmployer : HomeEmployerViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeEmployerVC") as! HomeEmployerViewController
                            window.rootViewController = HomeEmployer
                        }
            
            
                    }
                    else {
                        Coordinator.goToLogin()
//                        let loginView : LoginViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
//                        window.rootViewController = loginView
                    }
        }
        


        window.makeKeyAndVisible()
        self.window = window
        
    }

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

