//
//  StandingsViewController.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit


class StandingsViewController: UIViewController{
    
    var teams = []
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting Standings...")
            self.teams = ParseOps.sharedOps().getStandings()
            dispatch_async(dispatch_get_main_queue(), {
                self.activityIndicator.stopAnimating()
                for team in self.teams
                {
                    print("Team Name: \(team.teamName) Wins: \(team.wins) Losses \(team.losses) Cup Differential: \(team.cupDifferential)");
                }
                    //Do anything that needs to use the retrieved objects in this area.
                        //Example: print("5th Team: \(self.teams[5].teamName)")
            })
        })
        
        //Don't try to use the objects in this area 'cause it wont work...
    }
    
}