//
//  ViewController.swift
//  AC_Characters
//
//  Created by Michael Hardin on 5/23/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //var charSections = [CharSection]()
    var allSections: [[Character?]?]!
    
    
    private func setupChars(){
        let sectionTitlesCount = UILocalizedIndexedCollation.currentCollation().sectionTitles.count
        allSections = [[Character?]?](count: sectionTitlesCount, repeatedValue: nil)
        
        let chars = Character.characters()
        for char in chars {
            let collation = UILocalizedIndexedCollation.currentCollation()
            let sectionNumber = collation.sectionForObject(char, collationStringSelector: Selector("name"))
            if allSections[sectionNumber] == nil {
                allSections[sectionNumber] = [Character?]()
            }
            allSections[sectionNumber]!.append(char)
        }
        for index in 0...sectionTitlesCount-1 {
            print(index)
            let chars = allSections[index]
            if let chars = chars {
                allSections[index] = chars.sort(<)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChars()
        automaticallyAdjustsScrollViewInsets = false
        navigationItem.rightBarButtonItem = editButtonItem()
    }
    
    
    
    }
    
    


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing {
            tableView.setEditing(true, animated: true)
        }else {
            tableView.setEditing(false, animated: true)
        }
    }
    
//     func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        
//        return UILocalizedIndexedCollation.currentCollation().sectionIndexTitles
//    }
    
    func tableView(tableView: UITableView,sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        return UILocalizedIndexedCollation.currentCollation()
            .sectionForSectionIndexTitleAtIndex(index)
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return UILocalizedIndexedCollation.currentCollation().sectionIndexTitles[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return allSections.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        if let charSection = allSections[section] {
            rows = charSection.count
        }
        return rows    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("CharacterCell", forIndexPath: indexPath) as? CharacterCell {
            let charSection = allSections[indexPath.section]
            let character = charSection![indexPath.row]!
            cell.charNameLabel.text = character.name
            cell.charGameLabel.text = Character.gameToString(character.game)
            if let imageView = cell.charImageView, charImage = character.image {
                imageView.image = charImage
            }
            if character.type == .Assassin {
                cell.charSideImageView.image = UIImage(named: "acicon.png")
            }else if character.type == .Templar {
                cell.charSideImageView.image = UIImage(named: "Templar-icon.png")
            }else {
                cell.charSideImageView.image = UIImage(named: "supp.png")
            }
            
            return cell
        }else {
            return CharacterCell()
        }
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            var charSection = allSections[indexPath.section]!
            charSection.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("GoToDetail", sender: indexPath)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToDetail" {
            if let detailController = segue.destinationViewController as? DetailTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let charSection = allSections[indexPath.section]!
                    let char = charSection[indexPath.row]
                    detailController.character = char
                }
            }
        }
    }
}