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
    
    var i = 0
    
    var teamOne = ""
    
    var teamTwo = ""

    
    let textCellIdentifier = "cell"
    
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var roundLbl: UILabel!
    
    @IBAction func swipeRight(sender: AnyObject) {
        
        if roundNum > 1{
            roundNum--
        }
        
        roundLbl.text = "Round \(roundNum)"
        
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
        
    }
    
    @IBAction func swipeLeft(sender: AnyObject) {
        
        if roundNum < 10{
            roundNum++
        }
        
        roundLbl.text = "Round \(roundNum)"
        
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
        
    }
    

    @IBAction func nextRoundBtn(sender: AnyObject) {
        
        if roundNum < 10{
            roundNum++
        }
        
        roundLbl.text = "Round \(roundNum)"
        
        teamList = getRoundSchedule(roundNum)
        
        i = 0
        
        self.tableView.reloadData()
    }
    
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
        
        teamList = getRoundSchedule(roundNum)
        
        let nib = UINib(nibName: "gameTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: textCellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        roundLbl.text = "Round \(roundNum)"
        
        self.tableView.rowHeight = 70.0
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return teamList.count/2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: gameCell = self.tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! gameCell
        

        //This is the part that I'm not sure makes sense or not. It definitely works but not sure if this is the best way to do it.
        let row = indexPath.row
        
            cell.teamOneLbl.text = "\(teamList[row*2])"
            cell.teamTwoLbl.text = "\(teamList[row*2+1])"
            cell.gameCountLbl.text = "\(row+1)"
            
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        teamOne = teamList[indexPath.row*2] as! String
        teamTwo = teamList[indexPath.row*2+1] as! String
        
        performSegueWithIdentifier("modalSegue", sender: nil)
        
        print("\(teamList[indexPath.row*2]) vs. \(teamList[indexPath.row*2+1])")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "modalSegue") {
            var svc = segue.destinationViewController as! gamePopup;
            
            svc.one = teamOne
            svc.two = teamTwo
            
        }
    }
    
    
}