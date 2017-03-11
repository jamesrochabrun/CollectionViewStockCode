//
//  User.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 2/8/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import TRON

//user conformst to JSONDECODABLE PROTOCOL!!
struct User: JSONDecodable {
    let name: String
    let username: String
    let bioText: String
    let profileImageURL: String
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImageURL = json["profileImageUrl"].stringValue
    }
    
}
