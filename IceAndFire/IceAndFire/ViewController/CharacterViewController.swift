//
//  CharacterViewController.swift
//  IceAndFire
//
//  Created by Omar Alex on 28/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var cultureLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var diedLabel: UILabel!
    
    var character : Character?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let character = character {
            nameLabel.text = character.name
            genderLabel.text = character.gender
            cultureLabel.text = character.culture
            bornLabel.text = character.born
            diedLabel.text = character.died
        }
        

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
