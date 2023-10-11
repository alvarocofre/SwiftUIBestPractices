//
//  DateExtension.swift
//  ffmmSystem
//
//  Created by Alvaro Cofre Perez on 21-05-23.
//

import Foundation

public extension Date {
    func formatteddMMMDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: self)
    }
    
    func formattedAsMMYY() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        return dateFormatter.string(from: self)
    }
    
    func formattedAsddMMYY() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: self)
    }
    
    func isFirstDayOfMonth() -> Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        
        return components.day == 1
    }
    
}
