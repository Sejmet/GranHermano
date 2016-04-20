//
//  PostObject.swift
//  GranHermano
//
//  Created by Maria Belen Marañon on 4/20/16.
//  Copyright © 2016 Maria Belen Marañon. All rights reserved.
//

import UIKit
import SwiftyJSON

class PostObject: NSObject {
    var event: String!
    var data: NSDictionary!
    
    required init(json: JSON) {
        event = json["event"].stringValue
        data = json["data"].dictionaryObject
    }
}
