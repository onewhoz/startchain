//
//  NameViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/14/22.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var lastName, firstName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

    func CleanFieldData(){
        firstName = firstNameTextField.text!
        lastName = lastNameTextField.text!
    }
    private func UpdateLocalAccountInfo(){
        UserInfo.first_name = firstName
        UserInfo.last_name = lastName
    }
    func UpdateAccountInfoAndMoveOn(){
        CleanFieldData()
        let data = ["first_name" : firstName, "last_name" : lastName]
        Data.setDataForUser(data as [String : Any]){
            self.UpdateLocalAccountInfo()
            Coordinator.pushNavBar("AgeVC", "SettingUpProfile", self.navigationController.self!)
        }
        
    }
    
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        UpdateAccountInfoAndMoveOn()
        
    }
    
}
