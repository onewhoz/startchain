//
//  AgeViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/14/22.
//

import UIKit

class AgeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        Coordinator.pushNavBar("InterestVC", "SettingUpProfile", navigationController.self!)
    }
    
    
}
