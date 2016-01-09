//
//  TipUserDefaultKeys.swift
//  Tip
//
//  Created by Paul Thormahlen on 1/8/16.
//  Copyright © 2016 Paul Thormahlen. All rights reserved.
//

import Foundation

class TipUserDefaults{

    static let lastBillDate        = "com.peloki.pthormahlen.tip.LastBillDate"
    static let lastBillAmount      = "com.peloki.pthormahlen.tip.LastBillAmount"
    static let defaultLocaleString = "com.peloki.pthormahlen.tip.defaultLocale"
    static let defaultTipAmount    = "com.peloki.pthormahlen.tip.DefulatTipAmount"
    
    static func  setPreferedTipAmmount(tipPercent:Double, tipIndex: Int){
        let userDefaultSettings = NSUserDefaults.standardUserDefaults()
        userDefaultSettings.setDouble(tipPercent, forKey: tipKeyForIndex(tipIndex))
    }
    
    static func saveBillAmount(billTotal:Double){
        let userDefaultSettings = NSUserDefaults.standardUserDefaults()
        userDefaultSettings.setValue(NSDate(), forKey: TipUserDefaults.lastBillDate)
        userDefaultSettings.setDouble(billTotal, forKey: TipUserDefaults.lastBillAmount)
    }

    
    static func tipKeyForIndex(index:Int) -> String{
        return "\(TipUserDefaults.defaultTipAmount).\(index)"
    }
    
    static func getPreferedTipValues() -> [Double]{
        return [getPreferedTip1(),getPreferedTip2(),getPreferedTip3()]
    }
    
    static func getPreferedTip1() -> Double{
        return getPreferedTipWithDefaut(0.18, index:0)
    }
    
    static func getPreferedTip2() -> Double{
        return getPreferedTipWithDefaut(0.20, index:1)
    }
    
    static func getPreferedTip3() -> Double{
        return getPreferedTipWithDefaut(0.22, index:2)
    }
    
    static func getPreferedTipWithDefaut(defaultTip:Double, index:Int) -> Double{
        let userDefaultSettings = NSUserDefaults.standardUserDefaults()
        var tip = userDefaultSettings.doubleForKey(tipKeyForIndex(index))
        if !(tip > 0){
            tip = defaultTip
        }
        return tip
        
    }
    
    
}
