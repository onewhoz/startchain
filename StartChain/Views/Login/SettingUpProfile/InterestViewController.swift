//
//  InterestViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/14/22.
//

import UIKit

class InterestViewController: UIViewController {

    @IBOutlet weak var createTeamView: UIView!
    @IBOutlet weak var createTeamImage: UIImageView!
    @IBOutlet weak var joinTeamView: UIView!
    @IBOutlet weak var joinTeamImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createTeamBtnClicked(_ sender: Any) {
        joinTeamView.alpha = 0.65
        joinTeamImage.image = UIImage(systemName: "circle")
        createTeamView.alpha = 1
        createTeamImage.image = UIImage(systemName: "checkmark.circle")
    }
    
    @IBAction func joinTeamBtnClicked(_ sender: Any) {
        joinTeamView.alpha = 1
        joinTeamImage.image = UIImage(systemName: "checkmark.circle")
        createTeamView.alpha = 0.65
        createTeamImage.image = UIImage(systemName: "circle")
    }
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        Coordinator.pushNavBar("ExperienceVC", "SettingUpProfile", navigationController.self!)
    }
}
