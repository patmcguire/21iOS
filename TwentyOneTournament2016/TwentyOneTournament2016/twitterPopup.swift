//
//  twitterPopup.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 1/17/16.
//  Copyright © 2016 21Tournament. All rights reserved.
//

import Foundation
import UIKit
import Parse

class twitterPopup: UIViewController, UITextFieldDelegate{
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    @IBOutlet var vertPopupConstraint: NSLayoutConstraint!
    
    @IBOutlet var horizPopupConstraint: NSLayoutConstraint!
    
    @IBOutlet var textBoxVertConstraint: NSLayoutConstraint!
    
    @IBOutlet var tweetBox: UITextField!
    
    @IBOutlet var instructionsLblHorizConst: NSLayoutConstraint!
    
    @IBOutlet var instructionsLbl: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var instructionsLblVertConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        //Set the popup size to fit whatever the screen width is. Should make it look right on all phone sizes.
        horizPopupConstraint.constant = screenSize.width - 50
        vertPopupConstraint.constant = screenSize.height - 250
        instructionsLblHorizConst.constant = screenSize.width - 75
        instructionsLblVertConstraint.constant = (screenSize.height - 250)/4
        
        tweetBox.delegate = self
    }
    
    @IBAction func cancelBtn(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func submitBtn(sender: AnyObject) {
        //TODO - Submit twitter entry to Parse
        
        
    }
    @IBAction func tweetBoxStartEditing(sender: AnyObject) {
        textBoxVertConstraint.constant = 100
        instructionsLbl.hidden = true
        
    }
    
    @IBAction func tweetBoxEndEditing(sender: AnyObject) {
        textBoxVertConstraint.constant = 50
        instructionsLbl.hidden = false
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}