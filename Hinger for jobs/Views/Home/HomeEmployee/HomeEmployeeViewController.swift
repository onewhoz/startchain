//
//  HomeEmployeeViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/5/22.
//

import UIKit
import FirebaseAuth
class HomeEmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        do{
                    try FirebaseAuth.Auth.auth().signOut()
            
                }
                catch{
                    print("Error")
                }
        
        let controller = storyboard?.instantiateViewController(identifier: "LoginVC") as! LoginViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)

    }
}
