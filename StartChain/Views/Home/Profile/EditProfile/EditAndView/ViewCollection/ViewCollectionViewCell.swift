//
//  ViewCollectionViewCell.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/22/22.
//

import UIKit

class ViewCollectionViewCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "HOla"
        return cell
    }
    

    @IBOutlet weak var viewTableView: UITableView!{
        didSet{
            viewTableView.delegate = self
            viewTableView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.viewTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewTableView.deselectRow(at: indexPath, animated: true)
    }

}
