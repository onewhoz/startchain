//
//  HomeEmployeeViewController.swift
//  Hinger for jobs
//
//  Created by Max Dovhopolyi on 6/5/22.
//

import UIKit
import FirebaseAuth
class HomeEmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutBtn(_ sender: Any) {
        Account.logOut()

    }
}
