//
//  RegSeasonViewController.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class RegSeasonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var roundNum = 1
    
    var teamList = []
    
    var schedule = []
    
    var i = 0
    
    var teamOne = ""
    
    var teamTwo = ""

    let textCellIdentifier = "cell"
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var roundLbl: UILabel!
    
    
    //Let the user go back a round by swiping R to L
    @IBAction func swipeRight(sender: AnyObject) {
        
        if roundNum > 1{
            roundNum--
        }
        
        roundLbl.text = "Round \(roundNum)"
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
    }
    
    
    //Let the user to forward a round by swiping L to R
    @IBAction func swipeLeft(sender: AnyObject) {
        
        if roundNum < 10{
            roundNum++
        }
        
        roundLbl.text = "Round \(roundNum)"
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
    }
    
    
    //Advance a round by tapping the Next Round arrow
    @IBAction func nextRoundBtn(sender: AnyObject) {
        
        if roundNum < 10{
            roundNum++
        }
        
        roundLbl.text = "Round \(roundNum)"
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
    }
    
    
    //Go back a round by tapping the Last Round arrow
    @IBAction func prevRoundBtn(sender: AnyObject) {
        
        if roundNum > 1{
            roundNum--
        }
        
        roundLbl.text = "Round \(roundNum)"
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
    }
    
 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        roundNum = 1
        
        //Initialize custom tableview cell
        let nib = UINib(nibName: "gameTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: textCellIdentifier)
        
        //Initialize TableView
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set round title to the current round
        roundLbl.text = "Round \(roundNum)"
        
        //Adjust tableview row height
        tableView.rowHeight = 80.0
        
        //Get matches for all rounds from Parse
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting schedule...")
            self.schedule = ParseOps.sharedOps().getRoundSchedule(8)
            dispatch_async(dispatch_get_main_queue(), {
                
                print((self.schedule[0].matches?[0].team1)!)
                
                
                self.tableView.reloadData()
                
            })
        })
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Determine number of cells in the Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return schedule.count
    }
    
    
    //Determine what gets placed in each Table View cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: gameCell = self.tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! gameCell
        

        //This is the part that I'm not sure makes sense or not. It definitely works but not sure if this is the best way to do it.
        let row = indexPath.row
        
            cell.teamOneLbl.text = "\((schedule[roundNum].matches?[indexPath.row].team1)!)"
            cell.teamTwoLbl.text = "\((schedule[roundNum].matches?[indexPath.row].team2)!)"
            cell.gameCountLbl.text = "\(row+1)"
            cell.teamOneRecordLbl.text = "(0-0)"
            cell.teamTwoRecordLbl.text = "(0-0)"
            
        
        return cell
    }
    
    
    //Everything that happens when you tap on a matchup
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        teamOne = (schedule[roundNum].matches?[indexPath.row].team1)!
        teamTwo = (schedule[roundNum].matches?[indexPath.row].team2)!
        
        performSegueWithIdentifier("modalSegue", sender: nil)
        
//        print("\(teamList[indexPath.row*2]) vs. \(teamList[indexPath.row*2+1])")
    }
    
    
    //Pass the selected matchup to the Popup
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "modalSegue") {
            let svc = segue.destinationViewController as! gamePopup;
            
            svc.one = teamOne
            svc.two = teamTwo
            
        }
    }
    
    
}