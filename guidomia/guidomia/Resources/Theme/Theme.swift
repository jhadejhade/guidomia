//
//  Theme.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation
import SwiftUI

struct Theme {
    var backgroundColor: Color
    var secondaryBackgroundColor: Color
    var primaryTextColor: Color
    var secondaryTextColor: Color
    var primaryColor: Color
    var lineHeight: CGFloat
    
    static let light = Theme(
        backgroundColor: Color(hex: "#858585"),
        secondaryBackgroundColor: Color(hex: "#D5D5D5"),
        primaryTextColor: Color(hex: "#000000", opacity: 0.45), 
        secondaryTextColor: Color(hex: "#000000"),
        primaryColor: Color(hex: "#FC6016"),
        lineHeight: 4
    )
    
    static let dark = Theme(
        backgroundColor: Color(hex: "#858585"),
        secondaryBackgroundColor: Color(hex: "#D5D5D5"),
        primaryTextColor: Color(hex: "#000000", opacity: 0.45),
        secondaryTextColor: Color(hex: "#000000"),
        primaryColor: Color(hex: "#FC6016"),
        lineHeight: 4
    )
}
