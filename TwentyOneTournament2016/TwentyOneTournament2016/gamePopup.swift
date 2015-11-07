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
    
    var one: String!
    
    var two: String!
    
    var winner: String!
    
    var cupDiffArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    
    
    @IBAction func teamOneBtnAction(sender: AnyObject) {
        
        winner = one
        
        print("Matchup winner: \(winner)")
    }

    @IBAction func teamTwoBtnAction(sender: AnyObject) {
        
        winner = two
        
        print("Matchup winner: \(winner)")
    }
    
    
    override func viewDidLoad() {
        
        teamOneBtn.setTitle(one, forState: UIControlState.Normal)
        teamTwoBtn.setTitle(two, forState: UIControlState.Normal)
        
        cupDiffPicker.dataSource = self
        cupDiffPicker.delegate = self

        if screenSize.width < 600 {
            horizPopUpConstraint.constant = 250
        }
        
        print (screenSize.width)
        
        print (screenSize.height)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cupDiffArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(cupDiffArray[row])"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //TODO - Add whatever you need to happen when the user selects the cup differential value they want
        
        print("\(cupDiffArray[row])")
    }
    
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = "\(cupDiffArray[row])"
        
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName: UIFont(name: "Futura", size: 10.0)!, NSForegroundColorAttributeName:UIColor.blackColor()])
        
        return myTitle
    }
    
    
    @IBAction func closeBtn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}