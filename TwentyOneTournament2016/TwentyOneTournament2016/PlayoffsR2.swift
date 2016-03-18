//
//  PlayoffsR2.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/25/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation


class PlayoffsR2: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

    @IBOutlet var tableView: UITableView!
    
    let cellId = "round2Cell"
    
    var matches = []
    
    
    override func viewDidLoad() {
        
        
        // Register custom cell
        var nib = UINib(nibName: "R2PlayoffCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.rowHeight = 150
        
        tableView.contentOffset = CGPoint(x:0, y:0)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: r2Cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! r2Cell
        
        let row = indexPath.row
        
        if row == 0{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        } else if row == 1{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        } else if row == 2{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        } else if row == 3{
            cell.team1Btn.setTitle(matches[row].team1, forState: UIControlState.Normal)
            cell.team2Btn.setTitle(matches[row].team2, forState: UIControlState.Normal)
        }
        
        if ((matches[row].seed1!) > 0){
            cell.seed1Lbl.text = "\(matches[row].seed1!)"
        }
        else{
            cell.seed1Lbl.text = ""
        }
        
        if ((matches[row].seed2!) > 0) {
            cell.seed2Lbl.text = "\(matches[row].seed2!)"
        }
        else{
            cell.seed2Lbl.text = ""
        }
        
        if (matches[row].winner! == 1){
            cell.team1Btn.tintColor = UIColor.greenColor()
            cell.team2Btn.tintColor = UIColor.redColor()
        }
        else if (matches[row].winner! == 2){
            cell.team2Btn.tintColor = UIColor.greenColor()
            cell.team1Btn.tintColor = UIColor.redColor()
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row+1)")
    }
    
}