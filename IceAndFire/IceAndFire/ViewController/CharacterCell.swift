//
//  CharacterCell.swift
//  IceAndFire
//
//  Created by Omar Alex on 28/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var characterPicture: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!

    func update(from character: Character) {
        nameLabel.text = (character.name == "" ? "No name":character.name)
    }
}
