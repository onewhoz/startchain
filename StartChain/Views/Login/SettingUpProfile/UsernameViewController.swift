//
//  UsernameViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/6/22.
//

import UIKit

class UsernameViewController: UIViewController {
    
    var username : String?


    @IBOutlet weak var usernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
  
    
    func CleanFieldData(){
        username = usernameTextField.text!
        username = username?.lowercased()
    }
    private func UpdateLocalAccountInfo(){
        UserInfo.username = username
    }
    func UpdateAccountInfoAndMoveOn(){
        CleanFieldData()
        let data = ["username" : username]
        Data.setDataForUser(data){
            self.UpdateLocalAccountInfo()
            Coordinator.pushNavBar("NameVC", "SettingUpProfile", self.navigationController.self!)
        }
        
    }
    
   
    
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        UpdateAccountInfoAndMoveOn()
    }
    

   
    
}
