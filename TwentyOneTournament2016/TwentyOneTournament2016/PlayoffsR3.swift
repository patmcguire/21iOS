//
//  PlayoffsR3.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/25/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation


class PlayoffsR3: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let cellId = "round3Cell"
    
    var matches = []
    
    
    
    override func viewDidLoad() {
        
        
        // Register custom cell
        var nib = UINib(nibName: "R3PlayoffCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.rowHeight = 260
        
        
        tableView.contentOffset = CGPoint(x:0, y:0)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: r3Cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! r3Cell
        
        let row = indexPath.row
        
        if row == 0{
            cell.team1Lbl.text = matches[row].team1
            cell.team2Lbl.text = matches[row].team2
        } else if row == 1{
            cell.team1Lbl.text = matches[row].team1
            cell.team2Lbl.text = matches[row].team2
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
    
}