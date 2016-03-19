//
//  PlayoffsR1.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/25/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation


class PlayoffsR1: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let cellId = "round1Cell"
    
    let seeds = [9,8,12,5,10,7,11,6]
    
    var teams = []
    
    var matches = []
    
    override func viewDidLoad() {
                
                // Register custom cell
        var nib = UINib(nibName: "R1PlayoffCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: self.cellId)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = 130
                
        self.tableView.contentOffset = CGPoint(x:0, y:0)
                
        self.tableView.reloadData()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: r1Cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! r1Cell
        
        let row = indexPath.row
        
        if row == 0{
            cell.team1Lbl.text = matches[row].team1
            cell.team2Lbl.text = matches[row].team2
        } else if row == 1{
            cell.team1Lbl.text = matches[row].team1
            cell.team2Lbl.text = matches[row].team2
        } else if row == 2{
            cell.team1Lbl.text = matches[row].team1
            cell.team2Lbl.text = matches[row].team2
        } else if row == 3{
            cell.team1Lbl.text = matches[row].team1
            cell.team2Lbl.text = matches[row].team2
        }
        
        
        cell.seed1.text = "\(matches[row].seed1!)"
        cell.seed2.text = "\(matches[row].seed2!)"
        
        if (matches[row].winner! == 1){
            cell.team1Lbl.textColor = UIColor.greenColor()
            cell.team2Lbl.textColor = UIColor.redColor()
        }
        else if (matches[row].winner! == 2){
            cell.team2Lbl.textColor = UIColor.greenColor()
            cell.team1Lbl.textColor = UIColor.redColor()
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row+1)")
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let svc = segue.destinationViewController as! PlayoffsR2;
//        
//        svc.scrollPosition = tableView.contentOffset
//        print(tableView.contentOffset)
//        
//        
//    }
    
}