//
//  HeaderTableViewCell.swift
//  StartChain
//
//  Created by Max Dovhopolyi on 6/21/22.
//

import UIKit


protocol ButtonDelegate {
    func onButtonTap(sender: Any)
}


class HeaderTableViewCell: UITableViewCell {
    var ProfileView = ProfileViewController()
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var profileImg : UIImageView!
    var delegate: ButtonDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameLabel.text = UserInfo.first_name!
        profileImg.layer.borderWidth = 1
        profileImg.layer.masksToBounds = false
        profileImg.layer.borderColor = UIColor.black.cgColor
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func btnCliclked(_ sender: Any) {
        
        delegate?.onButtonTap(sender: sender)
    }
    
}
