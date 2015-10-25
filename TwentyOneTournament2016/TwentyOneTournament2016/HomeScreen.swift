//
//  HomeScreen.swift
//  TwentyOneTournament2016
//
//  Created by Pat McGuire on 10/22/15.
//  Copyright © 2015 21Tournament. All rights reserved.
//

import Foundation
import UIKit

class HomeScreen: UIViewController {
    
    
    
    @IBAction func centerBtn(sender: AnyObject) {
        print("Center button tapped")
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
