//
//  EditCollectionViewCell.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/22/22.
//

import UIKit

class EditCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Privet"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var editTableView: UITableView!{
        didSet{
            editTableView.delegate = self
            editTableView.dataSource = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.editTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
       
    }

}
