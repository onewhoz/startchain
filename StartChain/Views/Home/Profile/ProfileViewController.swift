//
//  ProfileViewController.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/21/22.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ButtonDelegate {
   
    
    
    let data = ["Search Preferences", "Settings", "What Works", "Help Center"]
    let image = ["slider.horizontal.3", "gearshape.fill", "lightbulb.fill", "questionmark.circle.fill" ]
    
    
    
    @IBOutlet var tableView : UITableView! {
        didSet {
            let HeaderView = Bundle.main.loadNibNamed("HeaderTableViewCell", owner: self)?.first as! HeaderTableViewCell
            HeaderView.delegate = self
            tableView.dataSource = self
            tableView.delegate = self
            tableView.tableHeaderView = HeaderView
            
            
               }
    }
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.imageView?.image = UIImage(systemName: image[indexPath.row])
        cell.imageView?.tintColor = .systemGray
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
   
        switch indexPath.row{
        case 0:
            // Coordinator.pushNavBar("SearchPreferencesVC", "SearchPreferences", self.navigationController.self!)
            let story = UIStoryboard(name: "SearchPreferences", bundle: nil)
            let controller = story.instantiateViewController(withIdentifier: "SearchPreferencesNC")
            controller.modalPresentationStyle = .custom
            present(controller, animated: true)
            
            
            
        case 1:
            Coordinator.pushNavBar("SettingsVC", "Settings", self.navigationController.self!)
        case 2:
            Coordinator.pushNavBar("WhatWorksVC", "Profile", self.navigationController.self!)
        case 3:
            Coordinator.pushNavBar("HelpCentreVC", "Profile", self.navigationController.self!)
        default:
            print("Error has occured")
        }
    }
    func onButtonTap(sender: Any) {
      
        let story = UIStoryboard(name: "EditProfile", bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: "EditProfileNC")
        controller.modalPresentationStyle = .custom
        present(controller, animated: true)
       
    }
    
   
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationController?.title = ""
        self.navigationItem.backBarButtonItem?.title = "DONT"
        
        

        // Do any additional setup after loading the view.
    }
   
 
}


