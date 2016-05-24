//
//  DetailTableViewController.swift
//  AC_Characters
//
//  Created by Michael Hardin on 5/24/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet weak var charTypeLabel: UILabel!
    @IBOutlet weak var charGameLabel: UILabel!
    @IBOutlet weak var charNameLabel: UILabel!
    @IBOutlet weak var charImageView: UIImageView!
    var character: Character?
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        guard let character = character else {
            return
        }
        if let charImage = character.image {
            charImageView.image = charImage
              }
        charNameLabel.text = character.name
        charGameLabel.text = Character.gameToString(character.game)
        charTypeLabel.text = Character.typeToString(character.type)
        
    }
    
    
    
}
