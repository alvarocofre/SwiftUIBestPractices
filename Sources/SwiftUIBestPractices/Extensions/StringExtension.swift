//
//  StringExtension.swift
//  ffmmSystem
//
//  Created by Alvaro Cofre Perez on 22-05-23.
//

import Foundation


public extension String {
    func capitalizeFirstWord() -> String {
        let words = self.components(separatedBy: .whitespaces)
        guard let firstWord = words.first else {
            return self
        }
        let capitalizedFirstWord = firstWord.capitalized
        let restOfWords = words.dropFirst().joined(separator: " ").lowercased()
        return capitalizedFirstWord + " " + restOfWords
    }
    
    func capitalizeAndReturnFirstWord() -> String {
        guard let firstWord = self.components(separatedBy: .whitespaces).first else {
            return self
        }
        return firstWord.capitalized
    }
    
    func toDateWitFormat(format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
