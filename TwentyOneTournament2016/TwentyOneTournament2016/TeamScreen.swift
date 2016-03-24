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
    
    @IBOutlet var p1Lbl: UILabel!
    
    @IBOutlet var p2Lbl: UILabel!

    @IBOutlet var p3Lbl: UILabel!
    
    @IBOutlet var numOfSeasons: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    var cellIdentifier = "cell"
    
    var selectedTeam = ""
    
    var teamInfo: AnyObject!
    
    var teamSchedule = []
    
    
    override func viewDidLoad() {
        teamNameLbl.text = selectedTeam
        
        activityIndicator.startAnimating()
        
        
        p1Lbl.text = ""
        p2Lbl.text = ""
        p3Lbl.text = ""
        numOfSeasons.text = ""
        
        let nib = UINib(nibName: "teamScheduleCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        getTeamInfo()
        
    }
    
    func getTeamInfo(){
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting Standings...")
            self.teamInfo = ParseOps.sharedOps().getTeamInfo(self.selectedTeam)
            dispatch_async(dispatch_get_main_queue(), {
                
                //Do everthing you need to do with the Parse Objects in this area.
                self.teamSchedule = self.teamInfo.schedule
                self.tableView.reloadData()
                
                self.p1Lbl.text = self.teamInfo.player1
                self.p2Lbl.text = self.teamInfo.player2
                self.p3Lbl.text = self.teamInfo.player3
                self.numOfSeasons.text = "Number of Tournaments: \(self.teamInfo.seasons)"
                
                self.activityIndicator.stopAnimating()
            })
        })
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamSchedule.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: teamScheduleCell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! teamScheduleCell
        
        let row = indexPath.row
        
        cell.roundNumLbl.text = "#\(row+1). "

        if teamSchedule[row].matches?[0].team1 != selectedTeam{
            cell.opponentNameLbl.text = teamSchedule[row].matches?[0].team1!
            if teamSchedule[row].matches?[0].winner! == 1{
                cell.cupDiffLbl.text = "(-\(teamSchedule[row].matches![0].cupDifferential!))"
                cell.winOrLossLbl.text = "L"
            }else if teamSchedule[row].matches?[0].winner! == 2{
                cell.cupDiffLbl.text = "(\(teamSchedule[row].matches![0].cupDifferential!))"
                cell.winOrLossLbl.text = "W"
            } else{
                cell.cupDiffLbl.text = "(-)"
                cell.winOrLossLbl.text = "-"
            }
        } else {
            cell.opponentNameLbl.text = teamSchedule[row].matches![0].team2!
            if teamSchedule[row].matches?[0].winner! == 1{
                cell.cupDiffLbl.text = "(\(teamSchedule[row].matches![0].cupDifferential!))"
                cell.winOrLossLbl.text = "W"
            }else if teamSchedule[row].matches?[0].winner! == 2{
                cell.cupDiffLbl.text = "(-\(teamSchedule[row].matches![0].cupDifferential!))"
                cell.winOrLossLbl.text = "L"
            }else {
                cell.cupDiffLbl.text = "(-)"
                cell.winOrLossLbl.text = "-"
            }
        }
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        

    }
    
}