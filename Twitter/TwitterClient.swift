//
//  TwitterClient.swift
//  Twitter
//
//  Created by Allison Martin on 2/14/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "1TjY6gMvUIDTOoLvJryMvf60d"
let twitterConsumerSecret = "hSCF2IcrQgL5GhW6O2VIlE52lU6qlgkkImcNMIgz3aFYvgtN0O"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    class var sharedInstance: TwitterClient
    {
        struct Static
        {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }

}
