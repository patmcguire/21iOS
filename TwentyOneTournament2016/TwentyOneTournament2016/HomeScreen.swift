//
//  HomeScreen.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class HomeScreen: UIViewController {
    
    var parseOperator = ParseOps.init()
    
    
    @IBAction func centerBtn(sender: AnyObject) {
        print("Center button tapped")
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "21 Tournament 2016"
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = nil
    }
    
}