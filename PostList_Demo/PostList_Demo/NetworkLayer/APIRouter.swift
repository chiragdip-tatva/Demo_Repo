//
//  APIRouter.swift
//  PostList_Demo
//
//  Created by Chiragdip on 02/08/19.
//  Copyright © 2019 MAC190. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

//JSON Protocol for Model initialization
protocol IsJsonable {
    init?(parameter: JSON)
}

protocol Routable {
    var path        : String { get }
    var method      : HTTPMethod { get }
    var parameters  : Parameters? { get }
    var type        : IsJsonable.Type? { get }  //Will get return model type...
    var responseDataKey     : String? { get }   //Will get the response for this Key..
}


enum Router: Routable {
    case getPostListing(Int)
}

extension Router {
    var baseURL : String {
        return "https://hn.algolia.com/api/v1/"
    }
    
    var apiKeyWord: String {
        switch self {
        case .getPostListing(_):
            return "search_by_date"
        }
    }
    
    var path: String {
        return  self.baseURL + self.apiKeyWord
    }
    
}

extension Router {
    var method: HTTPMethod {
        return .get
    }
}

extension Router {
    var parameters: Parameters? {
        switch self {
        case .getPostListing(let pageNumber):
            return ["tags" : "story",
                    "page" : pageNumber]
        }
    }
}

extension Router {
    var type: IsJsonable.Type? {
        switch self {
        case .getPostListing:
            return PostModel.self
        }
    }
}

extension Router {
    var responseDataKey: String? {
        switch self {
        case .getPostListing:
            return "hits"
        }
    }
}

