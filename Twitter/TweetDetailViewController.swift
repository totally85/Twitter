//
//  TweetDetailViewController.swift
//  Twitter
//
//  Created by Allison Martin on 2/22/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    
    var tweet: Tweet!
            


    override func viewDidLoad()
    {
        super.viewDidLoad()
        
     
        tweetLabel.text = tweet.text
        timeLabel.text = tweet.createdAtString
        profilePic.setImageWithURL((tweet?.user!.profileImageUrl)!)
        nameLabel.text = tweet?.user!.name
        retweetCount.text = "\((tweet.retweet_count)!)"
        favoriteCount.text = "\((tweet.favorite_count)!)"

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
