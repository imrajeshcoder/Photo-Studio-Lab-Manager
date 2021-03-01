//
//  PSLMLeftMenuCell.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit

class PSLMLeftMenuCell: UITableViewCell {

    @IBOutlet weak var imgOutletMenuImage: UIImageView!
    @IBOutlet weak var lblOutletMenuName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
