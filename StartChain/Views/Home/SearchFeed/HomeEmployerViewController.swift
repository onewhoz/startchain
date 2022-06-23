//
//  HomeEmployerViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/5/22.
//

import UIKit
import FirebaseAuth

class HomeEmployerViewController: UIViewController {

    override func viewDidLoad() {
        print(UserInfo.skill_set)
        
//
        // Do any additional setup after loading the view.
    }
   
    @IBAction func settingPreferences(_ sender: Any){
        Coordinator.pushNavBar("SearchPreferencesVC", "SearchPreferences", self.navigationController.self!)
    }
    @IBAction func logOutBtn(_ sender: Any) {
        Account.logOut()

}
}
