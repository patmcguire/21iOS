//
//  TeamScreen.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 2/6/16.
//  Copyright © 2016 21Tournament. All rights reserved.
//

import Foundation

class TeamScreen: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet var teamNameLbl: UILabel!
    
    @IBOutlet var tableView: UITableView!
    
    var cellIdentifier = "cell"
    
    var selectedTeam = ""
    
    var schedule: [String] = ["Round 1","Round 2","Round 3","Round 4","Round 5","Round 6","Round 7","Round 8"]
    
    
    override func viewDidLoad() {
        teamNameLbl.text = selectedTeam
        
        
        //TODO - get team schedule and results information from Parse
        
        let nib = UINib(nibName: "teamScheduleCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schedule.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: teamScheduleCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! teamScheduleCell
        
        let row = indexPath.row
        
        cell.roundNumLbl.text = "#\(row+1). "

        //TODO - fill out the rest of the values of the team schedule cell
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        

    }
    
}