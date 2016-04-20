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
    func fetchAllPostsWith(url: String, completion: ([PostObject], [PostObject]) -> Void) {
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    let jsonDictionary = json.dictionaryValue
                    var history = jsonDictionary["history"]
                    var videoPostsArray = [PostObject]()
                    var imagePostsArray = [PostObject]()
                    
                    var i = 0
                    for _ in history! {
                        let post = PostObject(json:history![i])
                        
                        if (post.event == "sh_media") {
                            videoPostsArray.append(post)
                        } else {
                            imagePostsArray.append(post)
                        }
                        
                        i += 1
                    }
                    
                    completion(videoPostsArray, imagePostsArray)
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}
