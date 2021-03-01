//
//  CommonFunctions.swift
//  MarketWatch
//
//  Created by Senrysa on 01/03/21.
//

import Foundation

class CommonFunctions {
    static func getPercentageChange(closeValue : Double,currentValue : Double, quoteType : String) -> String{
        if quoteType == "CURRENCY" {
            return "\((((currentValue - closeValue)/currentValue)*100).roundTo4f())%"
        }
        return "\((((currentValue - closeValue)/currentValue)*100).roundTo2f())%"
    }
}

extension Double {
  func roundTo0f() -> String {
    return String(format: "%.0f", self)
  }

  func roundTo1f() -> String {
    return String(format: "%.1f", self)
  }

  func roundTo2f() -> String {
    return String(format: "%.2f", self)
  }
    
    func roundTo4f() -> String {
      return String(format: "%.4f", self)
    }

  func roundToNf(n : Int) -> String {
    return String(format: "%.\(n)f", self)
  }
}
