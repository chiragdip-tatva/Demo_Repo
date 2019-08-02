//
//  APIManager.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import SwiftyJSON
import Alamofire

//APIManager class definitions...
class APIManager {
    
    // Custom header field
    private let header = [
        "Content-Type":"application/json"
    ]
    
    //Shared Object initialization
    static let shared = APIManager()

    private let sessionManager : SessionManager!
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.httpMaximumConnectionsPerHost = 10
        sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
}
