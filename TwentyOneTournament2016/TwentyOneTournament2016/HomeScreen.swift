//
//  HomeScreen.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit
import Parse

class HomeScreen: UIViewController {
    
    var parseOperator = ParseOps.init()
    
    var returnedTweets: [String] = []
    
    var binaryCount = 0b0000
    
    @IBOutlet var twitterZoneBackground: UIImageView!
    
    weak var timer: NSTimer?
    
    @IBOutlet var twitterLabel: UILabel!
    
    @IBAction func centerBtn(sender: AnyObject) {
        print("Center button tapped")
    }
    
    override func viewDidLoad() {
        retrieveTweets()
        
        #if PLEB_VERSION
            print("This is the PLEB_VERSION")
        #endif
        
        //Set shadow for round label at the bottom.
        twitterZoneBackground.layer.shadowColor = UIColor.blackColor().CGColor
        twitterZoneBackground.layer.shadowOpacity = 0.5
        twitterZoneBackground.layer.shadowOffset = CGSize(width: 0, height: -1)
    }
    
    func startTimer(){
        if timer == nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "setTwitterLabel", userInfo: nil, repeats: true)
        }


    }
    
    override func viewWillAppear(animated: Bool) {
        retrieveTweets()
    }
    
    func setTwitterLabel(){
        if returnedTweets.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(returnedTweets.count)))
            
            UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.twitterLabel.alpha = 0.0
                }, completion: {
                    (finished: Bool) -> Void in
                    
                    //Once the label is completely invisible, set the text and fade it back in
                    self.twitterLabel.text = self.returnedTweets[randomIndex]
                    
                    // Fade in
                    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                        self.twitterLabel.alpha = 1.0
                        }, completion: nil)
            })
            
            print("Changed label")
        }
    }
    
    func retrieveTweets(){
        startTimer()
        
        var query = PFQuery(className:"Twitter")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) tweets.")
                // Do something with the found objects
                
                if let objects = objects {
                    for object in objects {
                        self.returnedTweets.append(object["tweet"] as! String)
                    }
                }
               
                self.setTwitterLabel()
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = nil
        if timer != nil{
            timer!.invalidate()
        }
    }
    
}