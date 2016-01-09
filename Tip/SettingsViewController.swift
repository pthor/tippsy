//
//  SettingsViewController.swift
//  Tip
//
//  Created by Paul Thormahlen on 1/5/16.
//  Copyright © 2016 Paul Thormahlen. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let userDefaultSettings = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var lowTipTextInput: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var middleTipTextInput: UITextField!
    @IBOutlet weak var highTipTextInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaultIndex = userDefaultSettings.integerForKey(TipUserDefaults.defaultTipAmount)
        tipControl.selectedSegmentIndex = defaultIndex
        
        let tip1 = savedTipToString(TipUserDefaults.getPreferedTip1())
        let tip2 = savedTipToString(TipUserDefaults.getPreferedTip2())
        let tip3 = savedTipToString(TipUserDefaults.getPreferedTip3())
            
        lowTipTextInput.text = tip1
        middleTipTextInput.text = tip2
        highTipTextInput.text = tip3
        
        tipControl.setTitle("\(tip1)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(tip2)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(tip3)%", forSegmentAtIndex: 2)
        
    }

    @IBAction func firstTipAmountEditingChanged(sender: UITextField) {
        updateDefaultTipForTextField(sender, tipIndex: 0)
    }
    @IBAction func secondTipAmountEditingChanged(sender: UITextField) {
        updateDefaultTipForTextField(sender, tipIndex: 1)
    }
    @IBAction func thirdTipAmountEditingChanged(sender: UITextField) {
        updateDefaultTipForTextField(sender, tipIndex: 2)
    }
    
    @IBAction func updateDefaultTipSetting(sender: UISegmentedControl) {
        userDefaultSettings.setInteger(sender.selectedSegmentIndex, forKey: TipUserDefaults.defaultTipAmount)
        userDefaultSettings.synchronize()
    }
    
    private func updateDefaultTipForTextField(textFeild: UITextField, tipIndex: Int){
        if let tipPercent = Int(textFeild.text!){
            //restric tip ammount to positive numbers and max 200%
            if tipPercent < 200 && tipPercent > 0 {
                tipControl.setTitle("\(textFeild.text!)%", forSegmentAtIndex: tipIndex)
                TipUserDefaults.setPreferedTipAmmount((Double(tipPercent)/100.0), tipIndex: tipIndex)
            }
        }
    }
    
    private func savedTipToString(tip:Double) -> String{
        return "\(Int(tip*100))"
    }

}
