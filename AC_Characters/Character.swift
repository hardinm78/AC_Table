//
//  Character.swift
//  AC_Characters
//
//  Created by Michael Hardin on 5/23/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

enum Type: Int {
    case Assassin
    case Templar
    case Supporting
}
enum Game: Int{
    case AC1
    case AC2
    case ACB
    case ACR
    case AC3
    case ACL
    case AC4
    case ACU
    case ACS
}


class Character: NSObject, Comparable {
    var name: String
    var image: UIImage?
    var type: Type
    var game: Game
    
    init(withName name:String,imageName:String?,type:Type,game:Game) {
        self.name = name
        self.type = type
        self.game = game
        if let imageName = imageName{
            if let image = UIImage(named: imageName){
                self.image = image
            }
        }
    }
    
    static func typeToString(type: Type) -> String{
        var typeString = ""
        switch type {
        case .Assassin:
            typeString = "Assassin"
        case .Templar:
            typeString = "Templar"
        case .Supporting:
            typeString = "Supporting Role"
        }
        return typeString
    }
    
    static func gameToString(game:Game) -> String{
        var gameString = ""
        switch game {
        case .AC1:
            gameString = "Assassin's Creed"
        case .AC2:
            gameString = "Assassin's Creed 2"
        case .ACB:
            gameString = "Assassin's Creed Brotherhood"
        case .ACR:
            gameString = "Assassin's Creed Revelations"
        case .AC3:
            gameString = "Assassin's Creed 3"
        case .ACL:
            gameString = "Assassin's Creed Liberation"
        case .AC4:
            gameString = "Assassin's Creed 4: Black Flag"
        case .ACU:
            gameString = "Assassin's Creed Unity"
        case .ACS:
            gameString = "Assassin's Creed Syndicate"
        }
        return gameString

    }
    static func characters() -> [Character]{
        var characters = [Character]()
        characters.append(Character(withName: "Altaïr Ibn-La'Ahad", imageName: "altair.png", type: .Assassin,game: .AC1))
        characters.append(Character(withName: "Arno Victor Dorian", imageName: "arno_dorian.jpg", type: .Assassin,game: .ACU))
        characters.append(Character(withName: "Al-Mualim", imageName: "al mualim.jpg", type: .Templar,game: .AC1))
        characters.append(Character(withName: "Cesare Borgia", imageName: "cesare.jpg", type: .Templar,game: .ACB))
        
        characters.append(Character(withName: "Abu'l Nuquod", imageName: "abdul_nuquod.jpg", type: .Templar,game: .AC1))
        characters.append(Character(withName: "Achilles Davenport", imageName: "achilles_davenport.jpg", type: .Assassin,game: .AC3))
        characters.append(Character(withName: "Aveline de Grandpré", imageName: "aveline.png", type: .Assassin,game: .ACL))
        characters.append(Character(withName: "Catarina Sforza", imageName: "catarina.jpg", type: .Supporting,game: .AC2))
        
        characters.append(Character(withName: "Connor Kenway", imageName: "connor.jpg", type: .Assassin,game: .AC3))
        characters.append(Character(withName: "Desmond Miles", imageName: "desmond_miles.jpg", type: .Assassin,game: .AC1))
        characters.append(Character(withName: "Ezio Auditore da Firenze", imageName: "ezio.png", type: .Assassin,game: .AC2))
        characters.append(Character(withName: "Haytham Kenway", imageName: "haytham.png", type: .Templar,game: .AC3))

        characters.append(Character(withName: "Lucrezia Borgia", imageName: "lucrezia_borgia.jpg", type: .Templar,game: .ACB))
        characters.append(Character(withName: "Majd Addin", imageName: "majd_addin.jpg", type: .Templar,game: .AC1))
        characters.append(Character(withName: "Rodrigo Borgia", imageName: "rodrigo_borgia.jpg", type: .Templar,game: .AC2))
        characters.append(Character(withName: "Warren Vidic", imageName: "warren_vidic.jpg", type: .Templar,game: .AC1))
        
        characters.append(Character(withName: "Edward Kenway", imageName: "edward.png", type: .Assassin,game: .AC4))
        characters.append(Character(withName: "Jacob Frye", imageName: "jacob.png", type: .Assassin,game: .ACS))
        characters.append(Character(withName: "Evie Frye", imageName: "evie.png", type: .Assassin,game: .ACS))
        characters.append(Character(withName: "Robert de Sable'", imageName: "robert.png", type: .Templar,game: .AC1))
        
        
        return characters
    }
    
}

func < (lhs: Character, rhs: Character) -> Bool {
    return lhs.name < rhs.name
}