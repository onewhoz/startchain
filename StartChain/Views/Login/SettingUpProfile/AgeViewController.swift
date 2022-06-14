//
//  AgeViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/14/22.
//

import UIKit

class AgeViewController: UIViewController {
    
    var dateOfBirth: String?
    let minimumAge: Int = 16
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dobDatePicker.maximumDate = Date()

       
    }
    
    
    func CleanFieldData(){
        dateOfBirth = "\(dobDatePicker.date)"
    }
    func AlertHandler(){
        let alert = UIAlertController(title: "Age restriction", message: "You have to be at least 16 years old to register", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

    func UpdateAccountInfoAndMoveOn(){
        
        if Int(ageLabel.text!)! >= minimumAge{
            CleanFieldData()
            let data = ["date_of_birth" : dateOfBirth]
            Data.setDataForUser(data){
                UserInfo.date_of_birth = self.dateOfBirth
                Coordinator.pushNavBar("InterestVC", "SettingUpProfile", self.navigationController.self!)
            }

        }
        else {
            AlertHandler()
        }
                
    }
    
    
    
    

  
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        UpdateAccountInfoAndMoveOn()
//        Coordinator.pushNavBar("InterestVC", "SettingUpProfile", navigationController.self!)
    }
    
    
    @IBAction func valueHasChangedDatePicker(_ sender: Any) {
        

        let interval = Date() - dobDatePicker.date
        ageLabel.text = "\(interval)"
     
        
        
    }
}
