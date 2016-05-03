//
//  SettingsViewController.swift
//  tips
//
//  Created by Shahaf Abileah on 5/2/16.
//  Copyright © 2016 Shahaf Abileah. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentageToggle: UISegmentedControl!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultPercentIndex = defaults.integerForKey("default_tip_percentage_index")
        defaultTipPercentageToggle.selectedSegmentIndex = defaultPercentIndex
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(
            defaultTipPercentageToggle.selectedSegmentIndex,
            forKey: "default_tip_percentage_index"
        )
        defaults.synchronize()
    }
}
