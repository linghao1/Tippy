//
//  SettingsViewController.swift
//  Tippy
//
//  Created by LING HAO on 9/26/16.
//  Copyright © 2016 Blue Bambosa. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipIndex = defaults.integerForKey("DEFAULT_TIP_INDEX")
        tipSegment.selectedSegmentIndex = defaultTipIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipChanged(sender: AnyObject) {
        let tipSegment = sender as! UISegmentedControl
        let index = tipSegment.selectedSegmentIndex
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(index, forKey: "DEFAULT_TIP_INDEX")
    }

}
