//
//  Account.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/8/22.
//

import Foundation
import FirebaseAuth

class Account {
    
    static func logOut(){
        do{
                    try FirebaseAuth.Auth.auth().signOut()
            
                }
                catch{
                    print("Error has occured")
                }
        
        Coordinator.changeViewControllerWithIdentifier("LoginVC", "Main")
    }
    
    
    static func continueWhereLeft(){
        Data.fetchUser {
            if UserInfo.account_type == nil {
                Coordinator.changeViewControllerWithIdentifier("CreatingAnAccountVC", "Main")
            }
            
            else if UserInfo.username == nil || UserInfo.first_name == nil || UserInfo.date_of_birth == nil || UserInfo.interest == nil || UserInfo.skill_set == nil{
                Coordinator.changeViewControllerWithIdentifier("SettingUpProfileForIndividualNC", "SettingUpProfile")
            }
            
            
            else{
                if UserInfo.account_type == "employee"{
                    Coordinator.changeViewControllerWithIdentifier("HomeEmployeeVC", "Main")
    
                }
                else {
//                    Coordinator.changeViewControllerWithIdentifier("HomeEmployerVC")
                    Coordinator.changeViewControllerWithIdentifier("HomeTBC", "Home")
                }
            }
       
        }


    }
}
