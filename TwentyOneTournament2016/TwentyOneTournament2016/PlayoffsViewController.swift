//
//  PlayoffsPageViewController.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/25/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import UIKit

class PlayoffsPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var myViewControllers : [UIViewController] = []
    
    var schedule = []
    
    //    override func viewWillAppear(animated: Bool) {
    //        super.viewWillAppear(true)
    //        self.navigationController?.setNavigationBarHidden(true, animated: false)
    //    }
    //
    //    override func viewWillDisappear(animated: Bool) {
    //        super.viewWillDisappear(true)
    //        self.navigationController?.setNavigationBarHidden(false, animated: false)
    //    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //        self.automaticallyAdujstsPageViewInsets = false
        self.delegate = self
        self.dataSource = self
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
            print("Getting Standings...")
            self.schedule = ParseOps.sharedOps().getPlayoffs()
            dispatch_async(dispatch_get_main_queue(), {
                let p1 = self.storyboard?.instantiateViewControllerWithIdentifier("R1") as! PlayoffsR1
                p1.matches = self.schedule[0].matches
                let p2 = self.storyboard?.instantiateViewControllerWithIdentifier("R2") as! PlayoffsR2
                p2.matches = self.schedule[1].matches
                let p3 = self.storyboard?.instantiateViewControllerWithIdentifier("R3") as! PlayoffsR3
                p3.matches = self.schedule[2].matches
                let p4 = self.storyboard?.instantiateViewControllerWithIdentifier("R4") as! PlayoffsR4
                p4.matches = self.schedule[3].matches
                let p5 = self.storyboard?.instantiateViewControllerWithIdentifier("R5") as! PlayoffsR5
                if p4.matches[0].winner == 1{
                    p5.winner = p4.matches[0].team1
                }
                else if p4.matches[0].winner == 2{
                    p5.winner = p4.matches[0].team2
                }
                
                self.myViewControllers = [p1,p2,p3,p4,p5]
                
                
                for index in 0 ..< self.myViewControllers.count {
                    NSLog("\(self.myViewControllers[index])")
                }
                
                let startingViewController = self.viewControllerAtIndex(0)
                let viewControllers: NSArray = [startingViewController]
                
                self.setViewControllers(viewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: {(done: Bool) in
                })
                
                NSLog("loaded!");
                
            })
        })
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Private Function
    func viewControllerAtIndex (index: NSInteger) -> UIViewController{
        return myViewControllers[index]
    }
    
    //Delegates and Datasource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        NSLog("Entered to BeforeViewController")
        
        var index = myViewControllers.indexOf(viewController)!
        NSLog("\(index)")
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index--
        if index == myViewControllers.count {
            return nil
        }
        NSLog("\(index)")
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        NSLog("Entered to BeforeViewController")
        
        var index = myViewControllers.indexOf(viewController)!
        NSLog("\(index)")
        if index == NSNotFound {
            return nil
        }
        index++
        if index == myViewControllers.count {
            return nil
        }
        NSLog("\(index)")
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return myViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}
