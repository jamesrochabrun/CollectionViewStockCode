//
//  Service.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 2/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON


struct Service {
    
    //USING TRON LIBRARY
    //1 create a tron object
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    //2 creating a singleton that manages the requests
    static let sharedInstance = Service()
    //3 go to step 2 in Homedatasource class and create a succes class that handles the response
    
    //4 create a method to fecth json with a completion block
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> ()) {
        //generic type
        let request: APIRequest<HomeDataSource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDataSource) in
            completion(homeDataSource, nil)
        }) { (err) in
            completion(nil, err)
        }
    }
    
    //5 create a failure class
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }

    
    
}






