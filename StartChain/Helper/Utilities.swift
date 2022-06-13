//
//  Utilities.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/4/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

class Utilities{
    
    
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{8,}$")
        return passwordTest.evaluate(with: password)
    }
    static func isValidEmail(_ enteredEmail:String) -> Bool {
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"  // 1

          let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)  // 2
        return emailValidationPredicate.evaluate(with: enteredEmail)

    }
        
    
    static func getUserInfo(completed: @escaping () -> ()){
            guard let uid = Auth.auth().currentUser?.uid else {
                            print("User not found")
                            return
                        }
          
            Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
                if let error = error {
                    print("Error has occured")
                    return
                }
                guard let data = snapshot?.data() else {
                    print("Error has occured")
                    return
                }
                
                let uid = data["uid"] as? String ?? ""
                let account_type = data["account_type"] as? String ?? ""
                UserInfo.uid = uid
                UserInfo.account_type = account_type
                

                completed()
            }
            
        }
    
  
    
}


    
