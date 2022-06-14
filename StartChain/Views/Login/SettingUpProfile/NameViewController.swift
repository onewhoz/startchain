//
//  NameViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/14/22.
//

import UIKit

class NameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        Coordinator.pushNavBar("AgeVC", "SettingUpProfile", navigationController.self!)
    }
    
}
