//
//  Cordinator.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/7/22.
//

import UIKit

class Coordinator {
    static var window : UIWindow!
    
    
    
    static func goToCreatingAnAcount(){
        
        
//
//        let controller = storyboard.instantiateViewController(identifier: "CreatingAnAccountVC") as! CreatingAnAccountViewController
//
//
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//
//        UIApplication.shared.windows.first?.rootViewController = controller
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//
    }
    static func goToLogin(){
       let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
       //let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "LoginVC") as! LoginViewController
        

        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        
//        UIApplication.shared.windows.first!.rootViewController = controller
//        UIApplication.shared.windows.first?.makeKeyAndVisible()
//        
        Coordinator.window.rootViewController = controller
        
    }

}
