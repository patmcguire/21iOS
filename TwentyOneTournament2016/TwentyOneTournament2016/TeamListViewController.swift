//
//  TeamListViewController.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class TeamListViewController: UIViewController{
    
    var schedule = []
    
    override func viewDidLoad() {
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            ParseOps.sharedOps().saveMatch("zESRLSEK2e", winner: 1, cd: 4);
            ParseOps.sharedOps().saveMatch("ni7uc2FtR6", winner: 2, cd: 4);
            /*
            dispatch_async(dispatch_get_main_queue(), {
                print("Number of rounds: \(self.schedule.count)")
            });
            */
        });
    }
    
}