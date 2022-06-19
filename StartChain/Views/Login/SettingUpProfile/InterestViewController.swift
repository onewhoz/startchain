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
    var joinTeam : Bool!
    var interest : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Interest"
        joinTeamView.alpha = 0.65
        joinTeamImage.image = UIImage(systemName: "circle")
        createTeamView.alpha = 0.65
        createTeamImage.image = UIImage(systemName: "circle")

        // Do any additional setup after loading the view.
    }
    func joinOrCreateTeam(_ choice : String){
        if choice == "join" {
            joinTeam = true
            interest = "join_team"
            joinTeamView.alpha = 1
            joinTeamImage.image = UIImage(systemName: "checkmark.circle")
            createTeamView.alpha = 0.65
            createTeamImage.image = UIImage(systemName: "circle")
        }
        else if choice == "create" {
            joinTeam = false
            interest = "create_team"
            joinTeamView.alpha = 0.65
            joinTeamImage.image = UIImage(systemName: "circle")
            createTeamView.alpha = 1
            createTeamImage.image = UIImage(systemName: "checkmark.circle")
        }
    }
    

    @IBAction func createTeamBtnClicked(_ sender: Any) {
        joinOrCreateTeam("create")
    }
    
    @IBAction func joinTeamBtnClicked(_ sender: Any) {
      joinOrCreateTeam("join")
    }
    @IBAction func nextPageBtnClicked(_ sender: Any) {
        if joinTeam != nil {
            let data = ["interest" : interest]
            Data.setDataForUser(data as [String : Any]){
                UserInfo.interest = self.interest
                Coordinator.pushNavBar("SkillsVC", "SettingUpProfile", self.navigationController.self!)
            }
          
        }
        else {
            present(Utilities.AlertHandler("Error", "You have to chose your initial interest"), animated: true)
        }
    }
}
