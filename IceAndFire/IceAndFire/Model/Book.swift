//
//  Book.swift
//  IceAndFire
//
//  Created by Omar Alex on 28/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Book: Codable {
    var url: String?
    var name: String?
    var isbn: String?
    var numberOfPages: Int?
    var publisher: String?
    var country: String?
    var mediaType: String?
}
