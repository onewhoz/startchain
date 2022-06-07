//
//  SignInViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/4/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    func login(){
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if err != nil{
                // Couldn't sign in
                self.errorLabel.text = err?.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                // Signed in succesfully
                
                
                self.defaults.set(true, forKey: "IsUserSignedIn")
                
                Utilities.getUserInfo(){
                    self.nextMove()
                }
        
                
            }
        }
        
        
    }
    
    func nextMove(){
     //
        if (UserInfo.account_type != "employer" && UserInfo.account_type != "employee"){
            goToCreatingAnAcount()
        }
        else if (UserInfo.first_name == ""){
            goToSetUpProfile()
        }
        else if (UserInfo.account_type == "employer" && UserInfo.first_name != ""){
            goToHomeEmployerVC()
        }
        else {
            goToHomeEmployeeVC()
        }
        
        
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
    
    func goToCreatingAnAcount(){
        let controller = storyboard?.instantiateViewController(identifier: "CreatingAnAccountVC") as! CreatingAnAccountViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: false, completion: nil)
    }
    
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
 
    

    @IBAction func loginBtn(_ sender: Any) {
        login()
        
    }
    @IBAction func loginFacebookBtn(_ sender: Any) {
    }
    @IBAction func loginGoogleBtn(_ sender: Any) {
    }
    @IBAction func creatingAnAccountBtn(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SignUpVC") as! SignUpViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }
    @IBAction func forgotPswrdBtn(_ sender: Any) {
    }
    
}
