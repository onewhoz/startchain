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
        ContinueWhereLeft()
        

        // Do any additional setup after loading the view.
    }
    func ContinueWhereLeft(){
        if UserInfo.username == nil {
            return
        }
        else if UserInfo.first_name == nil {
            Coordinator.pushNavBar("NameVC", "SettingUpProfile", self.navigationController.self!, false)
        }
        else if UserInfo.date_of_birth == nil {
            Coordinator.pushNavBar("NameVC", "SettingUpProfile", self.navigationController.self!, false)
            Coordinator.pushNavBar("AgeVC", "SettingUpProfile", self.navigationController.self!, false)
        }
        else if UserInfo.interest == nil {
            Coordinator.pushNavBar("NameVC", "SettingUpProfile", self.navigationController.self!, false)
            Coordinator.pushNavBar("AgeVC", "SettingUpProfile", self.navigationController.self!, false)
            Coordinator.pushNavBar("InterestVC", "SettingUpProfile", self.navigationController.self!, false)
        }
        else if UserInfo.skill_set == nil {
            Coordinator.pushNavBar("NameVC", "SettingUpProfile", self.navigationController.self!, false)
            Coordinator.pushNavBar("AgeVC", "SettingUpProfile", self.navigationController.self!, false)
            Coordinator.pushNavBar("InterestVC", "SettingUpProfile", self.navigationController.self!, false)
            Coordinator.pushNavBar("SkillsVC", "SettingUpProfile", self.navigationController.self!, false)
        }
        
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
        if username != "" {
            let data = ["username" : username]
            Data.setDataForUser(data){
                self.UpdateLocalAccountInfo()
                Coordinator.pushNavBar("NameVC", "SettingUpProfile", self.navigationController.self!)
            }
        }
        else {
            present(Utilities.AlertHandler("Error", "You have to enter an username"), animated: true)
        }
        
        
    }
    
   
    
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        UpdateAccountInfoAndMoveOn()
    }
    

   
    
}
