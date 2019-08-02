//
//  BaseResponse.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import SwiftyJSON
import Alamofire

class BaseResponse {
 
    var success: Bool = false
    var message : String?
    var data : JSON?
    var errors: JSON?
    
    init(response:DataResponse<Any>) {
        let jsonResult: JSON = JSON(response.result.value!)
        
        self.message = jsonResult["Message"].stringValue
        
        if !jsonResult["hits"].isEmpty {
            self.data = jsonResult["hits"]
            self.success = true
        }else{
            self.success = false
            self.data = jsonResult
        }
        
        if !jsonResult["error"].isEmpty {
            self.success = false
            self.errors = jsonResult["error"]
        }
    }
}
