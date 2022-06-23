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
    
 
    
    @IBAction func findJobBtn(_ sender: Any) {
        UpdateAccountType("employee")
        Coordinator.changeViewControllerWithIdentifier("SettingUpProfileForEmployeeVC", "Main")
        
    }
    @IBAction func hirePplBtn(_ sender: Any) {
        UpdateAccountType("individual")
        Coordinator.changeViewControllerWithIdentifier("SettingUpProfileForIndividualNC", "SettingUpProfile")
    }
    @IBAction func signOutBtn(_ sender: Any) {
        Account.logOut()
    }
}
