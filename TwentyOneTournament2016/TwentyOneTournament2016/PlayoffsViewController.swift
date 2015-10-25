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
        
        let p1 = storyboard?.instantiateViewControllerWithIdentifier("R1") as! PlayoffsR1
        let p2 = storyboard?.instantiateViewControllerWithIdentifier("R2") as! PlayoffsR2
        let p3 = storyboard?.instantiateViewControllerWithIdentifier("R3") as! PlayoffsR3
        let p4 = storyboard?.instantiateViewControllerWithIdentifier("R4") as! PlayoffsR4
        let p5 = storyboard?.instantiateViewControllerWithIdentifier("R5") as! PlayoffsR5
        
        myViewControllers = [p1,p2,p3,p4,p5]
        
        
        for var index = 0; index < myViewControllers.count; ++index {
            NSLog("\(myViewControllers[index])")
        }
        
        let startingViewController = self.viewControllerAtIndex(0)
        let viewControllers: NSArray = [startingViewController]
        
        self.setViewControllers(viewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: {(done: Bool) in
        })
        
        NSLog("loaded!");
        
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
