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
    
    let cellId = "r2Cell"
    
    var midCells = [3,7,11,15]
    
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 16
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        
        let row = indexPath.row
        
        if (row + 1) % 4 == 0{
            cell.backgroundView = UIImageView (image: UIImage (named: "r2lowerBracket"))
            cell.backgroundColor = UIColor.redColor()
        } else if (row + 1) % 2 == 0{
            cell.backgroundView = UIImageView (image: UIImage (named: "r2topBracket"))
            cell.backgroundColor = UIColor.redColor()
        }else if (row + 1) % 2 != 0 {
            for n in 0...3{
                if row+1 == midCells[n]{
                    cell.backgroundView = UIImageView (image: UIImage (named: "r2midBracket"))
                    cell.backgroundColor = UIColor.redColor()
                }else{
                    cell.backgroundColor = UIColor.redColor()
                }
            }
        }else{
            cell.backgroundColor = UIColor.redColor()
        }
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print("Row: \(row+1)")
    }
    
}