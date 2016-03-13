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
    
    override func viewDidLoad() {
        
        
        // Register custom cell
        var nib = UINib(nibName: "R1PlayoffCell", bundle: nil)
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
        let cell: r1Cell = self.tableView.dequeueReusableCellWithIdentifier(cellId) as! r1Cell
        
        let row = indexPath.row
        
        if row == 0{
            cell.seed1.text = "\(seeds[0])"
            cell.seed2.text = "\(seeds[1])"
        } else if row == 1{
            cell.seed1.text = "\(seeds[2])"
            cell.seed2.text = "\(seeds[3])"
        } else if row == 2{
            cell.seed1.text = "\(seeds[4])"
            cell.seed2.text = "\(seeds[5])"
        } else if row == 3{
            cell.seed1.text = "\(seeds[6])"
            cell.seed2.text = "\(seeds[7])"
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