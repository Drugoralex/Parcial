//
//  HomeViewController.swift
//  IceAndFire
//
//  Created by Omar Alex on 28/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var books: [Book] = [Book]()
    var characters: [Character] = [Character]()
    var houses: [House] = [House]()
    @IBOutlet weak var booksLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var housesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        IceAndFireApi.getBook(responseHandler: self.responseHandlerBook)
        IceAndFireApi.getCharacter(responseHandler: self.responseHandlerCharacter)
        IceAndFireApi.getHouse(responseHandler: self.responseHandlerHouse)
    }
    
    func responseHandlerBook(response: [Book]) {
        self.books = response
        booksLabel.text = ("Number of books:\(books.count)")
    }
    
    func responseHandlerCharacter(response: [Character]) {
        self.characters = response
        characterLabel.text = ("Number of characters:\(characters.count)")
    }
    
    func responseHandlerHouse(response: [House]) {
        self.houses = response
        housesLabel.text = ("Number of houses:\(houses.count)")
    }

}
