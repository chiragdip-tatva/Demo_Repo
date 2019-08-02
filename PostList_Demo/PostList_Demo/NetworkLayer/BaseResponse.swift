//
//  BaseResponse.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import SwiftyJSON

class BaseResponse {
 
    var message : String?
    var data : JSON?
    var error: JSON?
    
    
}


//class BaseResponse {
//
//    var status: Int = 0
//    var success: Bool = false
//    var message: String?
//    var data: JSON?
//    var errors: JSON?
//
//    init(response:DataResponse<Any>) {
//        let jsonResult: JSON = JSON(response.result.value!)
//
//        self.status  = jsonResult["StatusCode"].intValue
//        self.success = jsonResult["Status"].boolValue
//        self.message = jsonResult["Message"].stringValue
//
//        if !jsonResult["hits"].isEmpty {
//            self.data = jsonResult["hits"]
//            self.success = true
//        }else{
//            self.data = jsonResult
//        }
//
//        if !jsonResult["error"].isEmpty {
//            self.errors = jsonResult["error"]
//        }
//    }
//}
