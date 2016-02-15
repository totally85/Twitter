//
//  ViewController.swift
//  Twitter
//
//  Created by Allison Martin on 2/14/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit
import BDBOAuth1Manager



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject)
    {
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("Got the request token")
            }) { (error: NSError!) -> Void in
                print("Error getting the request token: \(error)")
        }
    }

}

