//
//  Data.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/7/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore



class Data {
    
    private static var userID = Auth.auth().currentUser?.uid
    // guard let userID = Auth.auth().currentUser?.uid else { return }
    
    static func setDataForUser(_ data : [String : Any], completionHandler: (() -> Void)!){
        userID = Auth.auth().currentUser?.uid
        Firestore.firestore().collection("users").document(userID!).setData(data, merge: true)
        completionHandler()
        
    }
    static func fetchUser(completionHandler: (() -> Void)!){ // Fetach user
        Firestore.firestore().collection("users").document(userID!).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            let data = snapshot?.data()
            
           
            let account_type = data?["account_type"] as? String
            let first_name = data?["first_name"] as? String
            let last_name = data?["last_name"] as? String
            let username = data?["username"] as? String
            let date_of_birth = data?["date_of_birth"] as? String
            let date_of_registration = data?["date_of_registration"] as? String
            let email = data?["email"] as? String
            let skill_set = data?["skill_set"] as? [String]
            let interest = data?["interest"] as? String
      
            UserInfo.account_type = account_type
            UserInfo.first_name = first_name
            UserInfo.last_name = last_name
            UserInfo.username = username
            UserInfo.date_of_birth = date_of_birth
            UserInfo.date_of_registration = date_of_registration
            UserInfo.email = email
            UserInfo.skill_set = skill_set
            UserInfo.interest = interest
            
            
          
            
            completionHandler()
        }
        
    }
    
    
    
}
