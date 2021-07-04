//
//  PersonTableViewCell.swift
//  FriendMemory_Harooks
//
//  Created by Haruko Okada on 7/3/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var personGender: UILabel!
    
    @IBOutlet weak var personRelation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PersonTableViewCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
