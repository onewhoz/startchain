//
//  EditVirtuesCollectionViewCell.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/23/22.
//

import UIKit

class EditVirtuesTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var virtueTableView: UITableView!{
        didSet{
            virtueTableView.delegate = self
            virtueTableView.dataSource = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell = virtueTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        virtueTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }

}
