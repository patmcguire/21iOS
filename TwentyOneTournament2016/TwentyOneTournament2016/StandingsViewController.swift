//
//  StandingsViewController.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit


class StandingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var teams = []
    let cellIdentifier = "stdsCustomCell"
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        
        let nib = UINib(nibName: "standingsCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting Standings...")
            self.teams = ParseOps.sharedOps().getStandings()
            dispatch_async(dispatch_get_main_queue(), {
                self.activityIndicator.stopAnimating()
                
                //Do everthing you need to do with the Parse Objects in this area.
                self.tableView.reloadData()
                
            })
        })
        
        //Don't try to use the objects in this area 'cause it wont work...
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: standingsCustomCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! standingsCustomCell
        
        let row = indexPath.row
        
        cell.rankLbl.text = "#\(row+1)."
        cell.teamNameLbl.text = "\(teams[row].teamName)"
        cell.recordLbl.text = "\(teams[row].wins)-\(teams[row].losses) (\(teams[row].cupDifferential))"
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let secondViewController = self.storyboard?.instantiateViewControllerWithIdentifier("teamInfo") as! TeamScreen

        secondViewController.selectedTeam = teams[indexPath.row].teamName
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        print(teams[indexPath.row].teamName)
    }
    
}