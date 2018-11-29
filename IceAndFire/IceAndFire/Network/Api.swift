//
//  Api.swift
//  IceAndFire
//
//  Created by Omar Alex on 26/11/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import Alamofire

class Api {
    static let urlQuotes = "https://got-quotes.herokuapp.com/quotes"
    static func handleError(error: Error) {
        print("Error while requesting Data: \(error.localizedDescription)")
    }
    
    static private func get<T: Decodable> (
        urlString: String,
        paramters: [String: Any],
        responseType: T.Type,
        responseHandler: @escaping ((T) ->(Void)),
        errorHandler: (@escaping (Error) ->(Void)) = handleError) {
        Alamofire.request(urlString, method: .get, parameters: paramters)
        .validate()
            .responseJSON(completionHandler: {(response) in
                switch response.result{
                    case .success(let value):
                        do {
                            let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
                            let decoder = JSONDecoder()
                            let dataResponse = try decoder.decode(responseType, from: data)
                            responseHandler(dataResponse)
                        } catch {
                            print("\(error)")
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
        
    }
    
    static func getQuotes(responseHandler: @escaping (Quote) -> (Void),
                          errorHandler: @escaping (Error) -> (Void) = handleError) {
        
        self.get(urlString: urlQuotes, paramters: [:], responseType: Quote.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
}
