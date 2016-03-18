//
//  RegSeasonViewController.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class RegSeasonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, gamePopupControllerDelegate {
    
    var roundNum = 1
    
    var schedule = []
    
    var i = 0
    
    var teamOne = ""
    var teamTwo = ""
    var matchId = ""
    var matchCupDiff = 0
    var matchWinner = 0
    
    var teams = []

    let textCellIdentifier = "cell"
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    var refreshControl: UIRefreshControl!
    
    
    @IBOutlet weak var nextRoundBtnLbl: UIButton!
    
    @IBOutlet weak var prevRoundBtnLbl: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var roundLbl: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
        
    
    //Let the user go back a round by swiping L to R
    @IBAction func swipeRight(sender: AnyObject) {
        
        if roundNum > 1{
            roundNum--
            self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Right)
        }
        
        //If the round is #1 then hide the back arrow. If it's anything but 1 then show it.
        if roundNum == 1 {
            prevRoundBtnLbl.hidden = true
        } else {
            prevRoundBtnLbl.hidden = false
        }
        
        //If the round is = max round then hide the forward arrow. If it's anything else then show it.
        if roundNum == schedule.count{
            nextRoundBtnLbl.hidden = true
        } else {
            nextRoundBtnLbl.hidden = false
        }
        
        roundLbl.text = "Round \(roundNum)"
        
        i = 0
        
//        self.tableView.reloadData()

    }
    
    
    //Let the user go forward a round by swiping R to L
    @IBAction func swipeLeft(sender: AnyObject) {
        
        if roundNum < schedule.count{
            roundNum++
            self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Left)
        }
        
        //If the round is #1 then hide the back arrow. If it's anything but 1 then show it.
        if roundNum == 1 {
            prevRoundBtnLbl.hidden = true
        } else {
            prevRoundBtnLbl.hidden = false
        }
        
        //If the round is = max round then hide the forward arrow. If it's anything else then show it.
        if roundNum == schedule.count{
            nextRoundBtnLbl.hidden = true
        } else {
            nextRoundBtnLbl.hidden = false
        }
        
        roundLbl.text = "Round \(roundNum)"
        i = 0
        
//        self.tableView.reloadData()

    }
    
    
    //Advance a round by tapping the Next Round arrow
    @IBAction func nextRoundBtn(sender: AnyObject) {
        
        if roundNum < schedule.count{
            roundNum++
        }
        
        //If the round is #1 then hide the back arrow. If it's anything but 1 then show it.
        if roundNum == 1 {
            prevRoundBtnLbl.hidden = true
        } else {
            prevRoundBtnLbl.hidden = false
        }
        
        //If the round is = max round then hide the forward arrow. If it's anything else then show it.
        if roundNum == schedule.count{
            nextRoundBtnLbl.hidden = true
        } else {
            nextRoundBtnLbl.hidden = false
        }
        
        
        roundLbl.text = "Round \(roundNum)"
        i = 0
        
        
//        self.tableView.reloadData()
        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Left)
    }
    
    
    //Go back a round by tapping the Last Round arrow
    @IBAction func prevRoundBtn(sender: AnyObject) {
        
        if roundNum > 1{
            roundNum--
        }
        
        //If the round is #1 then hide the back arrow. If it's anything but 1 then show it.
        if roundNum == 1 {
            prevRoundBtnLbl.hidden = true
        } else {
            prevRoundBtnLbl.hidden = false
        }
        
        //If the round is = max round then hide the forward arrow. If it's anything else then show it.
        if roundNum == schedule.count{
            nextRoundBtnLbl.hidden = true
        } else {
            nextRoundBtnLbl.hidden = false
        }
        
        
        roundLbl.text = "Round \(roundNum)"
        
        i = 0
        
//        self.tableView.reloadData()
        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Right)
    }
    
 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        roundNum = 1
        
        activityIndicator.startAnimating()
        
        
        //Hide left arrow when on round #1
        if roundNum == 1{
            prevRoundBtnLbl.hidden = true
        }
        
        //Set shadow for round label at the bottom.
        roundLbl.layer.shadowColor = UIColor.blackColor().CGColor
        roundLbl.layer.shadowOpacity = 0.9
        roundLbl.layer.shadowOffset = CGSize(width: 0, height: -2)
        
        
        retrieveSchedule()
        
        //Initialize custom tableview cell

        
        
        //Set round title to the current round
        roundLbl.text = "Round \(roundNum)"
        
        //Adjust tableview row height
        tableView.rowHeight = 80.0
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(self.refreshControl)
        

        
    }
    
    func retrieveSchedule(){
        
        //Get matches for all rounds from Parse
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting schedule...")
            self.schedule = ParseOps.sharedOps().getRoundSchedule()
            dispatch_async(dispatch_get_main_queue(), {
                let nib = UINib(nibName: "gameTblCell", bundle: nil)
                self.tableView.registerNib(nib, forCellReuseIdentifier: self.textCellIdentifier)
                
                //Initialize TableView
                self.tableView.dataSource = self
                self.tableView.delegate = self
                
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()

            })
        })
    }
    
    func refresh(sender:AnyObject)
    {
        retrieveSchedule()
        self.refreshControl.endRefreshing()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Determine number of cells in the Table View
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        return schedule.count
        return (schedule[roundNum-1].matches?.count)!
    }
    
    
    //Determine what gets placed in each Table View cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: gameCell = self.tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! gameCell
        
        let row = indexPath.row
        
            cell.teamOneLbl.text = "\((schedule[roundNum-1].matches?[indexPath.row].team1)!)"
            cell.teamTwoLbl.text = "\((schedule[roundNum-1].matches?[indexPath.row].team2)!)"
            cell.gameCountLbl.text = "\(row+1)"
            cell.teamOneRecordLbl.text = "\((schedule[roundNum-1].matches?[indexPath.row].team1Record)!)"
            cell.teamTwoRecordLbl.text = "\((schedule[roundNum-1].matches?[indexPath.row].team2Record)!)"
       
        
        //Adjust cell UI based on past results
        if schedule[roundNum-1].matches?[indexPath.row].winner == 1 {
            cell.teamOneLbl.textColor = UIColor.greenColor()
            cell.teamTwoLbl.textColor = UIColor.redColor()
        } else if schedule[roundNum-1].matches?[indexPath.row].winner == 2{
            cell.teamTwoLbl.textColor = UIColor.greenColor()
            cell.teamOneLbl.textColor = UIColor.redColor()
        } else {
            cell.teamTwoLbl.textColor = UIColor.blackColor()
            cell.teamOneLbl.textColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    
    //Everything that happens when you tap on a matchup
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        teamOne = (schedule[roundNum - 1].matches?[indexPath.row].team1)!
        teamTwo = (schedule[roundNum - 1].matches?[indexPath.row].team2)!
        matchId = (schedule[roundNum - 1].matches?[indexPath.row].objectID)!
        matchCupDiff = (schedule[roundNum - 1].matches?[indexPath.row].cupDifferential)!
        matchWinner = (schedule[roundNum - 1].matches?[indexPath.row].winner)!
        
        performSegueWithIdentifier("modalSegue", sender: nil)
        
//        print("\(teamList[indexPath.row*2]) vs. \(teamList[indexPath.row*2+1])")
    }
    
    
    //Pass the selected matchup to the Popup
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "modalSegue") {
            let svc = segue.destinationViewController as! gamePopup;
            
            svc.one = teamOne
            svc.two = teamTwo
            svc.matchId = matchId
            svc.cupDifferential = matchCupDiff
            svc.winner = matchWinner
            svc.delegate = self
            
        }
    }
    
    func myVCDidFinish(controller: gamePopup) {
        retrieveSchedule()
    }
}