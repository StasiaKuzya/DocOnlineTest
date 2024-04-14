//
//  Int+extension.swift
//  DocOnlineTest
//
//  Created by Анастасия on 14.04.2024.
//

import Foundation

extension Int {
    func getYearsString() -> String? {
        var yearsString: String = ""
        if self == 0 {
            return "0 лет"
        }
        if "1".contains("\(self % 10)") {
            yearsString = "год"
        }
        if "234".contains("\(self % 10)") {
            yearsString = "года"
        }
        if "567890".contains("\(self % 10)") {
            yearsString = "лет"
        }
        if 11...14 ~= self % 100 {
            yearsString = "лет"
        }
        return "\(self) \(yearsString)"
    }
}
