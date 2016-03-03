//
//  User.swift
//  Twitter
//
//  Created by Allison Martin on 2/17/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userdidLoginNotification"
let userDidLogoutNotification = "userdidLogoutNotification"

class User: NSObject
{
    var name: String?
    var screenname: String?
    var profileImageUrl: NSURL?
    var tagline: String?
    var dictionary: NSDictionary
    var backgroundPicURL: NSURL?
    var statuses_count: Int?
    var following: Int?
    var followed_by: Int?
    var screenName: String?

    

    init(dictionary: NSDictionary)
    {
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        tagline = dictionary["description"] as? String
        statuses_count = ((dictionary["statuses_count"]!)as? Int)!
        following = ((dictionary["friends_count"]!)as? Int)!
        followed_by = ((dictionary["followers_count"]!)as? Int)!
        screenName = dictionary["screen_name"] as? String
        
        print("\(dictionary)")
        
        let URLString = dictionary["profile_image_url_https"] as? String
        if URLString != nil {
            profileImageUrl = NSURL(string: URLString!)
        } else {
            profileImageUrl = nil
        }
        
        let picString = dictionary["profile_background_image_url"] as? String
        //print("image \(picString)")
        if picString != nil
        {
            backgroundPicURL = NSURL(string: picString!)
        }
        else
        {
            backgroundPicURL = nil
        }
        
 
    }
    
    func logout()
    {
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
    }
    
    class var currentUser: User?
    {
        get
        {
            if _currentUser == nil
            {
                let data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
        
                if data != nil
                {
                    let dictionary: NSDictionary?
        
                    do
                    {
                        try dictionary = NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
        
                        _currentUser = User(dictionary: dictionary!)
                    }
        
                    catch
                    {
                        print(error)
                    }
                }
            }
            return _currentUser
        }
        set(user)
        {
            _currentUser = user
            
            if let _ = _currentUser
            {
                var data: NSData?
                
                do
                {
                    try data = NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: .PrettyPrinted)
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                }
                catch
                {
                    print(error)
                }

            }
        }
    }
}
