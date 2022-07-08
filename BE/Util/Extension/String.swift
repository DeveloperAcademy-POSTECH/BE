//
//  String.swift
//  BE
//
//  Created by GOngTAE on 2022/07/02.
//

import Foundation

extension String {
    
    // MARK: TimeStamp to DateString
    func dateExtract() -> String {
            let hour = self.substring(from: 11, to: 13)
            return "\(hour)"
        }
    
    // MARK: string to Date
    func stringToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

        let date:Date = dateFormatter.date(from: self)!
        
        return date
    }
    
    // MARK: substring
    func substring(from: Int, to: Int) -> String {
        guard (to >= 0) && (from <= self.count) && (from <= to) else {
            return ""
        }
        let start = index(startIndex, offsetBy: max(from, 0))
        let end = index(start, offsetBy: min(to, self.count) - from)
        return String(self[start ..< end])
    }


    // MARK: comma
    // ex. "1234567890".insertComma == "1,234,567,890"
    var insertComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        if let _ = self.range(of: ".") {
            let numberArray = self.components(separatedBy: ".")
            if numberArray.count == 1 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString)
                    else { return self }
                return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
            } else if numberArray.count == 2 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString)
                    else {
                    return self
                }
                return (numberFormatter.string(from: NSNumber(value: doubleValue)) ?? numberString) + ".\(numberArray[1])"
            }
        }
        else {
            guard let doubleValue = Double(self)
                else {
                return self
            }
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
        }
        return self
    }
}
