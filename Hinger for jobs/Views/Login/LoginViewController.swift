//
//  LoginViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/3/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class LoginViewController: UIViewController {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
     
    }
     
    func goToSetUpProfile(){
        if UserInfo.account_type == "employee" {
            let controller = storyboard?.instantiateViewController(identifier: "SettingUpProfileForEmployee") as! SettingUpProfileForEmployeeViewController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: false, completion: nil)
        }
        else {
            let controller = storyboard?.instantiateViewController(identifier: "SettingUpProfileForEmployer") as! SettingUpProfileForEmployerViewController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: false, completion: nil)
        }
            
    }
    
//    func goToCreatingAnAcount(){
//        let controller = storyboard?.instantiateViewController(identifier: "CreatingAnAccountVC") as! CreatingAnAccountViewController
//        
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        present(controller, animated: false, completion: nil)
//    }
    
    func goToHomeEmployerVC(){
        let controller = storyboard?.instantiateViewController(identifier: "HomeEmployerVC") as! HomeEmployerViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: false, completion: nil)
    }
    func goToHomeEmployeeVC(){
        let controller = storyboard?.instantiateViewController(identifier: "HomeEmployeeVC") as! HomeEmployeeViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: false, completion: nil)
    }

    @IBAction func signIn(_ sender: Any) {
        
        let controller = storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
        
        
    }
}
