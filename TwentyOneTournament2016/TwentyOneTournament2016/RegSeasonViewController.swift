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
    
    let gameList = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
    
    let textCellIdentifier = "cell"
    
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var roundLbl: UILabel!
    

    @IBAction func nextRoundBtn(sender: AnyObject) {
        roundNum++
        
        roundLbl.text = "Round \(roundNum)"
    }
    
    @IBAction func prevRoundBtn(sender: AnyObject) {
        
        if roundNum > 1{
            roundNum--
        }
        
        roundLbl.text = "Round \(roundNum)"
        
    }
    
 
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let nib = UINib(nibName: "gameTblCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: textCellIdentifier)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        roundLbl.text = "Round \(roundNum)"
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: gameCell = self.tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! gameCell
        
        let row = indexPath.row
        
        
        cell.teamOneLbl.text = "\(gameList[row])"
        cell.teamTwoLbl.text = "\(gameList[row])"
        
//        cell.textLabel?.text = "\(gameList[row])"
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        print("Button tapped")
    }
    
    
    
    
}