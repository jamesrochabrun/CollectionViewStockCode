//
//  HomeDataSource.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 1/31/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import LBTAComponents
import SwiftyJSON
import TRON

//GENERICS

//Constraininig this array extension to contain just JSON items inside
//a - Collection represents an array,
//b - IS constrained to a type JSON , only JSON objects can work for type

extension Collection where Iterator.Element == JSON {
    
    //c - her the type conforms the protocol Jsondecodable T can be USER or Tweet that also conform to that protocol,
    func decode<T: JSONDecodable>() throws -> [T] {
        //now T have access to the json method
        return try map{ try T(json: $0)}
    }
}

//remember Json and jsondecodable are "the same", one is a class and the other a protocol, the method.array returns items JSON


//this is the provider of data
class HomeDataSource: Datasource, JSONDecodable  {
    
    //2 create a model that will catch the succes json response
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let usersJsonArray = json["users"].array else {
            throw NSError(domain: "com.startap", code: 1, userInfo: [NSLocalizedDescriptionKey: "users json not valid structure"])
        }
        //decode can be able to infer the type User because we alreday assign it to the array constants
        self.users = try usersJsonArray.decode()
        
        guard let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.startap", code: 1, userInfo: [NSLocalizedDescriptionKey: "tweets json not valid structure"])
        }
        //decode can be able to infer the type Tweet because we alreday assign it to the array constants
        self.tweets = try tweetsJsonArray.decode()
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    override func numberOfItems(_ section: Int) -> Int {
        return section == 0 ? users.count : tweets.count
    }
    override func item(_ indexPath: IndexPath) -> Any? {
        return indexPath.section == 0 ? users[indexPath.item] : tweets[indexPath.row]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    
}








