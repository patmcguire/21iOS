//
//  PlayoffsR5.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/25/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation


class PlayoffsR5: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    let cellId = "round5Cell"
    
    var winner = ""
    
    
    override func viewDidLoad() {
        
        
        // Register custom cell
        var nib = UINib(nibName: "R5PlayoffCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: cellId)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.rowHeight = 520
        
        tableView.contentOffset = CGPoint(x:0, y:0)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: r5Cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! r5Cell
        
        cell.winnerLbl.text = winner
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row+1)")
    }

    
}