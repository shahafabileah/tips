//
//  ViewController.swift
//  tips
//
//  Created by Shahaf Abileah on 5/2/16.
//  Copyright © 2016 Shahaf Abileah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentToggle: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultPercentIndex = defaults.integerForKey("default_tip_percentage_index")
        tipPercentToggle.selectedSegmentIndex = defaultPercentIndex
        refreshTip()
        
        // Initially hide the labels.  We'll reveal them one at a time.
        billField.alpha = 0
        tipLabel.alpha = 0
        totalLabel.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        // Fade in the totalLabel.
        let duration = 0.25
        UIView.animateWithDuration(
            duration,
            animations: {
                self.billField.alpha = 1
            },
            completion: { finished in
                UIView.animateWithDuration(
                    duration,
                    animations: {
                        self.tipLabel.alpha = 1
                    },
                    completion: { finished in
                        UIView.animateWithDuration(
                            duration,
                            animations: {
                                self.totalLabel.alpha = 1
                            }
                        )
                    }
                )
            }
        )
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        refreshTip()
    }

    func refreshTip() {
        let tipPercentages = [0.15, 0.20, 0.25]
        let tipPercent = tipPercentages[tipPercentToggle.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercent
        let total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

