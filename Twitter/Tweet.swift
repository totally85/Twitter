//
//  Tweet.swift
//  Twitter
//
//  Created by Allison Martin on 2/17/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var favorite_count: Int?
    var retweet_count: Int?
    var favorited: Bool?
    var retweeted: Bool?
    
    init(dictionary: NSDictionary)
    {
 
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        
        var formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss"
        createdAt = formatter.dateFromString(createdAtString!)
        
        favorite_count = dictionary["favorite_count"] as! Int
        retweet_count = dictionary["retweet_count"] as! Int
        favorited = dictionary["favorited"] as! Bool
        retweeted = dictionary["retweeted"] as! Bool
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet]
    {
        var tweets = [Tweet]()
        
        for dictionary in array
        {
            tweets.append(Tweet(dictionary: dictionary))
        }
    
        return tweets
    }

}
