//
//  PostModel.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import Foundation
import SwiftyJSON

class PostModel : IsJsonable{
    
    let postID          : String!
    let title           : String!
    let createdAt       : String!
    var isActivatedPost : Bool = false
    
    //MARK: init
    required init(parameter: JSON) {
        postID         = parameter["objectID"].stringValue
        title          = parameter["title"].stringValue
        createdAt      = parameter["created_at"].stringValue.createdAtString
    }
}
