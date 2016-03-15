//
//  r2Cell.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 3/13/16.
//  Copyright © 2016 21Tournament. All rights reserved.
//

import UIKit

class r2Cell: UITableViewCell {

    @IBOutlet var team1Btn: UIButton!

    @IBOutlet var team2Btn: UIButton!
    
    @IBOutlet var seed1Lbl: UILabel!
    
    @IBOutlet var seed2Lbl: UILabel!

    @IBAction func team1BtnAction(sender: AnyObject) {
        team1Btn.tintColor = UIColor.greenColor()
        team2Btn.tintColor = UIColor.redColor()
        
        //TODO - Send result to Parse
        
    }
    
    
    @IBAction func team2BtnAction(sender: AnyObject) {
        
        team2Btn.tintColor = UIColor.greenColor()
        team1Btn.tintColor = UIColor.redColor()
        
        //TODO - Send result to Parse
    }
    
    
}
