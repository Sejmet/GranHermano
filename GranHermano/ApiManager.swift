//
//  ApiManager.swift
//  GranHermano
//
//  Created by Maria Belen Marañon on 4/20/16.
//  Copyright © 2016 Maria Belen Marañon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiManager: NSObject {

    static let sharedInstance = ApiManager()
    
    // With Alamofire
    func fetchAllPostsWith(url: String, completion: ([PostObject]) -> Void) {
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let jsonDictionary = json.dictionaryValue
                    var history = jsonDictionary["history"]
                    var postsArray = [PostObject]()
                    
                    var i = 0
                    for _ in history! {
                        postsArray.append(PostObject(json:history![i]))
                        i += 1
                    }
                    
                    completion(postsArray)
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}
