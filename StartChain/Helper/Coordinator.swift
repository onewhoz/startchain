//
//  Cordinator.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/7/22.
//

import UIKit

class Coordinator {
    static var window : UIWindow!
    static var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
   
    
    private static func transition(){
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.2
        
        UIView.transition(with: Coordinator.window, duration: duration, options: options, animations: {}, completion:
        { completed in
            // maybe do something on completion here
        })
    }
    
    private static func setStoryboard(_ storyboardIdentifier: String){
        storyboard = UIStoryboard(name: storyboardIdentifier, bundle: nil)
        
    }
    
    
    static func changeViewControllerWithIdentifierNoTransition(_ identifier:String, _ storyboardIdentifier: String){
        setStoryboard(storyboardIdentifier)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        Coordinator.window.rootViewController = controller
     
        
    }
    static func changeViewControllerWithIdentifier(_ identifier:String, _ storyboardIdentifier: String){
        
        changeViewControllerWithIdentifierNoTransition(identifier, storyboardIdentifier)
     
        transition()
        
    }
    
    static func pushNavBar(_ identifier: String, _ storyboardIdentifier: String, _ navbar: UINavigationController, _ anim: Bool = true){
        setStoryboard(storyboardIdentifier)
        
        let controller = storyboard.instantiateViewController(identifier: identifier)
       
        navbar.pushViewController(controller, animated: anim)
    
    }

    


}
