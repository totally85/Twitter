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
    @IBOutlet weak var invisibleButton: UIButton!
    
    var tweet: Tweet!
    
    var tweetID: Int = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
     
        tweetLabel.text = tweet.text
        timeLabel.text = tweet.createdAtString
        profilePic.setImageWithURL((tweet?.user!.profileImageUrl)!)
        nameLabel.text = tweet?.user!.name
        retweetCount.text = "\((tweet.retweet_count)!)"
        favoriteCount.text = "\((tweet.favorite_count)!)"
        tweetID = (tweet.tweetID as? Int)!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func favoritePressed(sender: AnyObject)
    {
        TwitterClient.sharedInstance.favTweet(Int(tweetID), params: nil, completion: {(error) -> () in
            
        self.tweet.favorited = true
        self.tweet.favorite_count! += 1
        self.favoriteCount.text = "\((self.tweet.favorite_count)!)"
        self.favoriteButton.enabled = false
            
        })
    }
    @IBAction func retweetPressed(sender: AnyObject)
    {
        TwitterClient.sharedInstance.retweet(Int(tweetID), params: nil, completion: {(error) -> () in
            
        self.tweet.retweeted = true
        self.tweet.retweet_count! += 1
        self.retweetCount.text = "\((self.tweet.retweet_count)!)"
        self.retweetButton.enabled = false
            
        })
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "profile"
        {
            let destinationViewController = segue.destinationViewController as! ProfilePageViewController
            destinationViewController.tweet = tweet
        }
        if segue.identifier == "replyTweet"
        {
            let destinationViewController = segue.destinationViewController as! ComposeViewController
            destinationViewController.tweet = tweet
        }
        
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
