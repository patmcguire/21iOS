//
//  gamePopup.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 11/2/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class gamePopup: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet var teamOneBtn: UIButton!
    
    @IBOutlet var teamTwoBtn: UIButton!
    
    @IBOutlet var cupDiffPicker: UIPickerView!
    
    @IBOutlet var horizPopUpConstraint: NSLayoutConstraint!
    
    @IBOutlet var vertPopUpConstraint: NSLayoutConstraint!
    
    var one: String!
    
    var two: String!
    
    var matchId: String!
    
    var winner = 0
    
    var cupDiffArray = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    
    var cupDifferential = 0
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
    
    @IBAction func teamOneBtnAction(sender: AnyObject) {
        
        //Set button styling for both buttons after selecting a winner
        teamOneBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        teamOneBtn.backgroundColor = UIColor.greenColor()
        teamOneBtn.alpha = 1.0
        
        teamTwoBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        teamTwoBtn.backgroundColor = UIColor.redColor()
        teamTwoBtn.alpha = 0.25
        
        
        //Set the winner variable to team one
        winner = 1
        
        print("Matchup winner: \(winner)")
    }

    @IBAction func teamTwoBtnAction(sender: AnyObject) {
        
        //Set buttons styling for both buttons after selecting a winner
        teamTwoBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        teamTwoBtn.backgroundColor = UIColor.greenColor()
        teamTwoBtn.alpha = 1.0
        
        teamOneBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        teamOneBtn.backgroundColor = UIColor.redColor()
        teamOneBtn.alpha = 0.25
        
        
        //Set the winner variable to team two
        winner = 2

        
        print("Matchup winner: \(winner)")
    }
    
    
    override func viewDidLoad() {
        
        //TODO - Preset winner and cupDifferential variables if game has already been played
        
        
        
        //TODO - Preset UI to show results of completed games
        
        
        //Make the team button titles match the teams that were picked from the Regular Season schedule.
        teamOneBtn.setTitle(one, forState: UIControlState.Normal)
        teamTwoBtn.setTitle(two, forState: UIControlState.Normal)
        
        //Set button styling for team buttons
        teamOneBtn.layer.borderColor = UIColor.grayColor().CGColor
        teamOneBtn.layer.borderWidth = 1
        teamOneBtn.layer.cornerRadius = 5
        
        teamTwoBtn.layer.borderColor = UIColor.grayColor().CGColor
        teamTwoBtn.layer.borderWidth = 1
        teamTwoBtn.layer.cornerRadius = 5
        
        
        //Initialize Picker View
        cupDiffPicker.dataSource = self
        cupDiffPicker.delegate = self

        
        //Set the popup size to fit whatever the screen width is. Should make it look right on all phone sizes.
        horizPopUpConstraint.constant = screenSize.width - 50
        vertPopUpConstraint.constant = screenSize.height - 250
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    //Determine how many rows are available in Picker View
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cupDiffArray.count
    }
    
    
    //What displays in the Picker View.
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(cupDiffArray[row])"
    }
    
    
    //Selecting a cup differential.
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        //Store selected cup differential in variable
        cupDifferential = cupDiffArray[row]

    }
    
    
    //Changing the font of the picker view numbers to match the rest of the app.
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = "\(cupDiffArray[row])"
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Futura", size: 10.0)!, NSForegroundColorAttributeName:UIColor.blackColor()])
        
        return myTitle
    }
    
    //Cancel button. Dismiss view popup and do nothing.
    @IBAction func cancelBtn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    //Submit button. Send updated match results to Parse.
    @IBAction func closeBtn(sender: AnyObject) {
        
        //Make sure a winner is selected
        if winner == 0{
            let alert = UIAlertController(title: "Select Winner", message: "You must select a winner before submitting a match result.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        //Make sure cup differential is selected
        if cupDifferential == 0{
            let alert = UIAlertController(title: "Set Cup Differential", message: "You must set the cup differential before submitting a match result.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        //Submit updated result to Parse if winner and cup differential have been set
        if winner != 0 && cupDifferential != 0 {
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
                print("Saving match result...")
                ParseOps.sharedOps().saveMatch(self.matchId, winner: self.winner, cd: self.cupDifferential)
                dispatch_async(dispatch_get_main_queue(), {
        
                })
            })
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
}