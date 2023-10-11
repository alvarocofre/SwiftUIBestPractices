//
//  DoubleExtension.swift
//  ffmmSystem
//
//  Created by Alvaro Cofre Perez on 21-05-23.
//

import Foundation

public extension Double {
    func formattedAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "es_CL")
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }

    func formattedWithDigits(digits: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = digits
        formatter.maximumFractionDigits = digits
        formatter.locale = Locale(identifier: "es_CL")
        
        let value = NSNumber(value: self)
        return formatter.string(from: value) ?? ""
    }
    
    func formattedAsPercentage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "es_CL")
        
        let value = NSNumber(value: self)
        return formatter.string(from: value) ?? ""
    }
    
}
