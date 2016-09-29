//
//  ViewController.swift
//  Tippy
//
//  Created by LING HAO on 9/23/16.
//  Copyright © 2016 Blue Bambosa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billText: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipIndex = defaults.integerForKey("DEFAULT_TIP_INDEX")
        if (tipSegment.selectedSegmentIndex != defaultTipIndex) {
            tipSegment.selectedSegmentIndex = defaultTipIndex
            calculateTip(tipSegment)
        }
        billText.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(sender: AnyObject) {
        let tipPercentage = [0.18, 0.2, 0.25]
        var text = billText.text!
        let index = text.startIndex
        if (!text.isEmpty && text[index] == "$") {
            text = text[index.advancedBy(1)..<text.endIndex];
        }
        let bill = Double(text) ?? 0
        let perc = tipPercentage[tipSegment.selectedSegmentIndex]
        let tip = bill * perc
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip);
        totalLabel.text = String(format: "$%.2f", total);
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

