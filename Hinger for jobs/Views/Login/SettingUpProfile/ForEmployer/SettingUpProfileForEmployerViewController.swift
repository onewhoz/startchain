//
//  SettingUpProfileForEmployerViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/6/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
class SettingUpProfileForEmployerViewController: UIViewController {

    @IBOutlet weak var companyNameTextField: UITextField!
    
    @IBOutlet weak var industryTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var positionTextField: UITextField!
    
    var companyName, industry, firstName, lastName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    
    func CleanFieldData(){
         companyName = companyNameTextField.text!
         industry = industryTextField.text!
         firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
         lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    func UpdateAccountInfo(){
       
        let data = ["company_name" : companyName,
                    "industry": industry,
                    "first_name" : firstName,
                    "last_name" : lastName]
        Data.SetDataForUser(data)
        
        UpdateLocalAccountInfo()
    
        
        
    }
    
    func UpdateLocalAccountInfo(){
        
        UserInfo.company_name = companyName
        UserInfo.industry = industry
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
