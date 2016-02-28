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
            
            
        }
    }
    @IBAction func favoritePressed(sender: AnyObject)
    {
        tweet.favorited = true
        tweet.favorite_count! += 1
        favoriteLabel.text = "\((tweet.favorite_count)!)"
        favoriteButton.enabled = false
    }
    @IBAction func retweetPressed(sender: AnyObject)
    {
        tweet.retweeted = true
        tweet.retweet_count! += 1
        retweetLabel.text = "\((tweet.retweet_count)!)"
        retweetButton.enabled = false
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
