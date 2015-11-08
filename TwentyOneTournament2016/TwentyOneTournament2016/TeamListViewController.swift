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
            self.schedule = ParseOps.sharedOps().getRoundSchedule(10);
            dispatch_async(dispatch_get_main_queue(), {
                print("Number of rounds: \(self.schedule.count)")
            });
        });
        
    }
    
}