//
//  TwitterCell.swift
//  Twitter
//
//  Created by Allison Martin on 2/19/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

class TwitterCell: UITableViewCell {

    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var tweetID: Int = 0
    
    var tweet: Tweet!
    {
        didSet
        {
            
            tweetLabel.text = tweet.text
            timeLabel.text = tweet.createdAtString
            thumbView.setImageWithURL((tweet?.user!.profileImageUrl)!)
            nameLabel.text = tweet.user!.name
            retweetLabel.text = "\((tweet.retweet_count)!)"
            favoriteLabel.text = "\((tweet.favorite_count)!)"
            tweetID = (tweet.tweetID as? Int)!
            
            
        }
    }
    @IBAction func favoritePressed(sender: AnyObject)
    {
        
        TwitterClient.sharedInstance.favTweet(Int(tweetID), params: nil, completion: {(error) -> () in
            
        self.tweet.favorited = true
        self.tweet.favorite_count! += 1
        self.favoriteLabel.text = "\((self.tweet.favorite_count)!)"
        self.favoriteButton.enabled = false
            
        })
    }
    @IBAction func retweetPressed(sender: AnyObject)
    {
        TwitterClient.sharedInstance.retweet(Int(tweetID), params: nil, completion: {(error) -> () in
            
        self.tweet.retweeted = true
        self.tweet.retweet_count! += 1
        self.retweetLabel.text = "\((self.tweet.retweet_count)!)"
        self.retweetButton.enabled = false
            
        })
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tweetLabel.preferredMaxLayoutWidth = tweetLabel.frame.size.width
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tweetLabel.preferredMaxLayoutWidth = tweetLabel.frame.size.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
