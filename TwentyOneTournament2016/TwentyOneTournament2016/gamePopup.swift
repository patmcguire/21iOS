//
//  gamePopup.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 11/2/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class gamePopup: UIViewController{
    
    @IBAction func closeBtn(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}