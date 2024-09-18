//
//  String+Extension.swift
//  guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//


extension Numeric where Self: Comparable {
    var abbreviated: String {
        let units = ["", "k", "m", "b", "t", "q"] 
        var value = Double("\(self)") ?? 0
        var unitIndex = 0

        while value >= 1000 && unitIndex < units.count - 1 {
            value /= 1000
            unitIndex += 1
        }

        return String(format: "%.1f%@", value, units[unitIndex])
    }
}
