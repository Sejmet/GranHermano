//
//  HistoryObject.swift
//  GranHermano
//
//  Created by Maria Belen Marañon on 4/20/16.
//  Copyright © 2016 Maria Belen Marañon. All rights reserved.
//

import UIKit
import SwiftyJSON

class HistoryObject: NSObject {
    var history: [JSON]!
    
    required init(json: JSON) {
        history = json["history"].arrayValue
    }
}
