//
//  SettingUpProfileForEmployeeViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/6/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SettingUpProfileForEmployeeViewController: UIViewController {

    var occupancy, firstName, lastName : String?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var occupancyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func CleanFieldData(){
         occupancy = occupancyTextField.text!
         firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func UpdateAccountInfo(){
       
        let data = ["occupancy" : occupancy,
                    "first_name" : firstName,
                    "last_name" : lastName]
        Data.SetDataForUser(data)
        
        UpdateLocalAccountInfo()
    
        
        
    }
    
    func UpdateLocalAccountInfo(){
        
        UserInfo.occupancy = occupancy
        UserInfo.first_name = firstName
        UserInfo.last_name = lastName
        
        
    }
  
    func nextView(){
        if UserInfo.account_type == "employee"{
            goToHomeEmployeeVC()
        }
        else{
            goToHomeEmployerVC()
        }
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
    
    
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        
        CleanFieldData()
        UpdateAccountInfo()
        nextView()
        
        
    }
    
}
