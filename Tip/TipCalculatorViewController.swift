//
//  ViewController.swift
//  Tip
//
//  Created by Paul Thormahlen on 1/5/16.
//  Copyright © 2016 Paul Thormahlen. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController {
    
    let userDefaultSettings = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var detailStackView: UIStackView!
    
    var lastBillAmount:Double = 0.0
    var lastBillEnteredAt: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        showRecentBill()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //animate the tip and total details container
        showTipDetails()
        updateAmounts()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        updateDefaultTipControl()
        updateAmounts()
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func showRecentBill(){
        if let lastBillDate:NSDate = userDefaultSettings.objectForKey(TipUserDefaults.lastBillDate) as! NSDate?{
            let diff = -1 * lastBillDate.timeIntervalSinceNow
            //if its been less than 10 minutes since a bill amount was udpated, use the last saved value
            if(diff <= 60*10){
                billField.text = NSString(format: "%.2f",userDefaultSettings.doubleForKey(TipUserDefaults.lastBillAmount)) as String
                onEditingChanged(self)
            }
        }
    }
    
    private func showTipDetails(){
        if(self.detailStackView.hidden){
            UIView.animateWithDuration(0.5) { () -> Void in
                self.detailStackView.hidden = false
            }
        }
    }
    
    private func updateAmounts()
    {
        let tipPercent = tipAmounts()[tipControl.selectedSegmentIndex]
        if let billAmount = Double(billField.text!){
            TipUserDefaults.saveBillAmount(billAmount)
            let tip = billAmount * tipPercent
            tipLabel.text = localizedCurrencyStringFromDouble(tip)
            totalLabel.text = localizedCurrencyStringFromDouble(billAmount + tip)
        }
        
    }
    
    private func localizedCurrencyStringFromDouble(amount:Double) -> String?
    {
        var localeString = userDefaultSettings.valueForKey(TipUserDefaults.defaultLocaleString) as! String?
        localeString = (localeString == nil) ? NSLocale.currentLocale().localeIdentifier : localeString
        
        return currencyFormatterForLocaleIndentifier(localeString!).stringFromNumber(amount)
    }
    
    private func currencyFormatterForLocaleIndentifier(localeString: String) -> NSNumberFormatter{
        let nsLocale = NSLocale(localeIdentifier: localeString)
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle;
        currencyFormatter.locale = nsLocale
        return currencyFormatter
    }
    
    private func updateDefaultTipControl()
    {
        let defaultIndex = userDefaultSettings.integerForKey(TipUserDefaults.defaultTipAmount)
        var tipAmountsArray = tipAmounts()
        for index in 0...2 {
          tipControl.setTitle("\(Int(tipAmountsArray[index]*100))%", forSegmentAtIndex: index)
        }
        tipControl.selectedSegmentIndex = defaultIndex
    }
    
    private func tipAmounts() -> [Double]
    {
        return TipUserDefaults.getPreferedTipValues()
    }

}

