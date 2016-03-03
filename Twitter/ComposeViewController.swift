//
//  ComposeViewController.swift
//  Twitter
//
//  Created by Allison Martin on 3/2/16.
//  Copyright © 2016 Allison Martin. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var composeField: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var characterCount: UILabel!
    
    
    
    var tweet: Tweet!
    var count = 139
    var status: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.composeField.delegate = self
       
        

        // Do any additional setup after loading the view.
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(textView: UITextView) {
        
        characterCount.text = ("\(count)")
        --count
        
        if (count < 0)
        {
            composeField.userInteractionEnabled = false
        }
        status = composeField.text
    }

    @IBAction func submitPressed(sender: AnyObject)
    {
        TwitterClient.sharedInstance.compose(status, params: ["status": status]) { (tweet, error) -> () in
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    /*[
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
