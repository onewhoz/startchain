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
    
    
    static func SetDataForUser(_ data : [String : Any]){
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        Firestore.firestore().collection("users").document(userID).setData(data, merge: true)
        
    }
}
