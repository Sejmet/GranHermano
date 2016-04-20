//
//  PostsListVC.swift
//  GranHermano
//
//  Created by Maria Belen Marañon on 4/20/16.
//  Copyright © 2016 Maria Belen Marañon. All rights reserved.
//

import UIKit

class PostsListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = "https://api.iamat.com/atcode/granhermano2015/history/till/now/100?type=sh_img,sh_media"
        
        ApiManager.sharedInstance.fetchAllPaymentMethodsWith(url) { (paymentMethods: [PostObject]) in
            
            
        }
    }

}
