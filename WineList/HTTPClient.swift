//
//  HTTPClient.swift
//  WineList
//
//  Created by Vladimir Saprykin on 10.06.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import Alamofire

//enum Router: URLRequestConvertible {
//    static let baseUrlString = "some url string"
//    
//    case Get(query: String)
//    
//    var URLRequest: NSMutableURLRequest {
//        let (path: String, parameters: [String: AnyObject]?) = {
//            switch self {
//            case .Get(let query):
//                return ("/get", ["q": query])
//            }
//        }()
//        
//        let URL = NSURL(string: Router.baseUrlString)!
//        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
//        
//        // set header fields
//        URLRequest.setValue("46a3f3f3281c43ec988465cd460fbacd06c85", forHTTPHeaderField: "x-apikey")
//        
//        let encoding = Alamofire.ParameterEncoding.URL
//        return encoding.encode(URLRequest, parameters: parameters).0
//    }
//}