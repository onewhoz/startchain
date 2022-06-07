//
//  CreatingAnAccountViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/4/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class CreatingAnAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func UpdateAccountType(_ account_type : String){
        guard let userID = Auth.auth().currentUser?.uid else { return }
        Firestore.firestore().collection("users").document(userID).setData([ "account_type": account_type ], merge: true)
        UserInfo.account_type = account_type
    }
    
    func MoveToSettingUpProfileForEmployee(){
        let controller = storyboard?.instantiateViewController(identifier: "SettingUpProfileForEmployee") as! SettingUpProfileForEmployeeViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }
    func MoveToSettingUpProfileForEmployer(){
        let controller = storyboard?.instantiateViewController(identifier: "SettingUpProfileForEmployer") as! SettingUpProfileForEmployerViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func findJobBtn(_ sender: Any) {
        UpdateAccountType("employee")
        MoveToSettingUpProfileForEmployee()
        
    }
    @IBAction func hirePplBtn(_ sender: Any) {
        UpdateAccountType("employer")
        MoveToSettingUpProfileForEmployer()
    }
    @IBAction func signInBtn(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "SignInVC") as! SignInViewController
        
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }
}
