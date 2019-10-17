//
//  NetworkService.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 17/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import Foundation

protocol NetworkServiceDelegate: class {
    func didCompleteRequest(result: AnyObject)
}


class NetworkService: NSObject {
    weak var delegate: NetworkServiceDelegate?
    
    func getFactsApiCall(urlString : String){
        
        guard let url = URL(string: urlString) else {
            print("Error: cannot create URL")
            return
        }

        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            let decoder = JSONDecoder()
            do {
                // Decode data to object
                print(responseData as NSData)
                let utf8Data = String(decoding: responseData, as: UTF8.self).data(using: .utf8)
                let object = try decoder.decode(Facts.self, from: utf8Data!)
                self.delegate?.didCompleteRequest(result: object as AnyObject)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
