//
//  EditCollectionViewCell.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/22/22.
//

import UIKit

class EditCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    let headerNames = ["My Virtues", "My Vitals", "My Vices", "My Accounts"]
    let content = [
        ["Work", "Job Title", "School", "Education Level", "Religious Beliefs", "Hometown", "Politics", "Search Intentions"],
        ["Name", "Gender", "Pronouns", "Sexuality", "Age", "Height", "Location", "Ethnicity", "Children", "Covid Vaccine"],
        ["Drinking", "Smoking", "Marijuana", "Drugs"],
        ["GitHub"]
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegularTableViewCell", for: indexPath) as! RegularTableViewCell
        
        cell.titleLabel.text = "\(content[indexPath.section][indexPath.row])"
        cell.detailLabel.text = "\(indexPath.row)"
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(headerNames[section])"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            
            
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let UINibCell = UINib(nibName: "RegularTableViewCell", bundle: nil)
        tableView.register(UINibCell, forCellReuseIdentifier: "RegularTableViewCell")
        
       
    }

}
