//
//  StarRatingView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct StarRatingView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var carRating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            let fullStars = Int(carRating)
            let hasHalfStar = carRating.truncatingRemainder(dividingBy: 1) != 0
            
            ForEach(0..<fullStars, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .foregroundColor(themeManager.currentTheme.primaryColor)
            }
            
            if hasHalfStar {
                Image(systemName: "star.leadinghalf.fill")
                    .foregroundColor(themeManager.currentTheme.primaryColor)
            }
            
            let emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0)
            ForEach(0..<emptyStars, id: \.self) { _ in
                Image(systemName: "star")
                    .foregroundColor(themeManager.currentTheme.primaryColor)
            }
        }
    }
}

#Preview {
    StarRatingView(carRating: 4.5)
        .environmentObject(ThemeManager())
}
