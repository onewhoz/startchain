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


    @IBAction func signIn(_ sender: Any) {
        Coordinator.changeViewControllerWithIdentifier("SignInVC")
    }
    
    @IBAction func signUp(_ sender: Any) {
        Coordinator.changeViewControllerWithIdentifier("SignUpVC")
        
        
    }
}
