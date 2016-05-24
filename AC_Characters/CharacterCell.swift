//
//  CharacterCell.swift
//  AC_Characters
//
//  Created by Michael Hardin on 5/24/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var charGameLabel: UILabel!
    @IBOutlet weak var charSideImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
