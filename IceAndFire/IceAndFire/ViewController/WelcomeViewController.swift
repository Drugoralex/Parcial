//
//  WelcomeViewController.swift
//  IceAndFire
//
//  Created by Omar Alex on 27/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var personajeLabel: UILabel!
    @IBOutlet weak var fraseLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Api.getQuotes(responseHandler: self.handleResponse, errorHandler: self.handleError)
        
    }
    
     func handleResponse(response : Quote) {
        personajeLabel.text = response.character
        fraseLabel.text = response.quote
    }
    
    func handleError(error: Error) {
        print("Error while requesting data\(error.localizedDescription)")
    }


}
