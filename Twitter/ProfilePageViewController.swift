//
//  ProfilePageViewController.swift
//  Twitter
//
//  Created by Allison Martin on 2/29/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {

    @IBOutlet weak var mainPic: UIImageView!
    @IBOutlet weak var backgroundPic: UIImageView!
    @IBOutlet weak var tweetCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var composeButton: UIButton!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainPic.setImageWithURL((tweet?.user!.profileImageUrl)!)
        backgroundPic.setImageWithURL((tweet?.user!.backgroundPicURL)!)
        tweetCount.text = "\((tweet.user!.statuses_count)!)"
        followingCount.text = "\((tweet.user!.following)!)"
        followersCount.text = "\((tweet.user!.followed_by)!)"
        usernameLabel.text = tweet.user!.screenname

        
        
    


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
