//
//  PostsListVC.swift
//  GranHermano
//
//  Created by Maria Belen Marañon on 4/20/16.
//  Copyright © 2016 Maria Belen Marañon. All rights reserved.
//

import UIKit

class PostsListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var imagesArray = [PostObject]()
    var videosArray = [PostObject]()
    var postsArray = [PostObject]()
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension

        let url = "https://api.iamat.com/atcode/granhermano2015/history/till/now/100?type=sh_img,sh_media"
        
        ApiManager.sharedInstance.fetchAllPostsWith(url) { (postsArray: [PostObject]) in
            self.postsArray = postsArray
            
            for post in postsArray {
                if (post.event == "sh_img") {
                    self.imagesArray.append(post)
                } else {
                    self.videosArray.append(post)
                }
            }
            
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch self.segmentedControl.selectedSegmentIndex {
        case 0:
            return self.postsArray.count
        case 1:
            return self.imagesArray.count
        case 2:
            return self.videosArray.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch self.segmentedControl.selectedSegmentIndex {
        default:
        
        let post = self.postsArray[indexPath.row]
        if (post.event == "sh_img") {
            let cell = tableView.dequeueReusableCellWithIdentifier("imageCell", forIndexPath:indexPath) as! ImagesPostTVC
            
            cell.imageTitleLabel.text = post.data.objectForKey("text")! as? String
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("videoCell", forIndexPath:indexPath) as! VideoPostTVC
            
            let dataInformation = post.data.objectForKey("data")
            let snippet = dataInformation?.objectForKey("snippet")
            cell.videoTitleLabel.text = snippet?.objectForKey("title")! as? String
            cell.videoDescriptionLabel.text = snippet?.objectForKey("description")! as? String
            
            return cell
        }
        
        
        }
    }

}
