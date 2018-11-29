//
//  IceAndFireApi.swift
//  IceAndFire
//
//  Created by Omar Alex on 28/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class IceAndFireApi {
    
    static let urlBooks = "https://anapioficeandfire.com/api/books"
    static let urlCharacters = "https://anapioficeandfire.com/api/characters"
    static let urlHouse = "https://anapioficeandfire.com/api/houses"
    static func handleError(error: Error) {
        print("Error while requesting data \(error.localizedDescription)")
    }
    
    private static func get<T: Decodable> (
        urlString: String,
        parameters: [String: Any],
        responseType: T.Type,
        responseHandler: @escaping ((T) ->(Void)),
        errorHandler: (@escaping (Error) ->(Void)) = handleError) {
        
        Alamofire.request(urlString, method: .get, parameters: parameters)
        .validate()
            .responseJSON(completionHandler: {(response) in
                switch response.result {
                case .success(let value):
                    do {
                        let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                        let decoder = JSONDecoder()
                        let responseData = try decoder.decode(responseType, from: data)
                        responseHandler(responseData)
                    } catch {
                        print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
    }
    
    static func getBook(responseHandler: @escaping ([Book]) ->Void ,
                        errorHandler: (@escaping (Error) -> (Void)) = handleError) {
        self.get(urlString: urlBooks, parameters: [:], responseType: [Book].self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func getCharacter(responseHandler: @escaping ([Character]) ->Void ,
                        errorHandler: (@escaping (Error) -> (Void)) = handleError) {
        self.get(urlString: urlCharacters, parameters: [:], responseType: [Character].self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func getHouse(responseHandler: @escaping ([House]) ->Void ,
                        errorHandler: (@escaping (Error) -> (Void)) = handleError) {
        self.get(urlString: urlHouse, parameters: [:], responseType: [House].self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
}
