//
//  Tweet.swift
//  TwitterLayout
//
//  Created by James Rochabrun on 2/9/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    
    let user: User
    let message: String
    
    init(json: JSON){
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
