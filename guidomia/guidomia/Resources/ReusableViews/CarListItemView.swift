//
//  CarListItemView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct CarListItemView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var car: Car
    var isExpanded: Bool
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(.tacoma)
                    .resizable()
                    .aspectRatio(3/2, contentMode: .fit)
                    .frame(width: 100)
                    .clipped()
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(String(format: "%@ %@", car.make, car.model))
                        .foregroundStyle(themeManager.currentTheme.primaryTextColor)
                        .font(.headline)
                        .lineLimit(nil)
                    
                    Text(String(format: "Price: %@", 2000.abbreviated))
                        .foregroundStyle(themeManager.currentTheme.primaryTextColor)
                        .font(.subheadline)
                    
                    StarRatingView(carRating: car.rating)
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            
            if isExpanded {
                HStack {
                    VStack(alignment: .leading, content: {
                        Text("Pros:")
                            .foregroundStyle(themeManager.currentTheme.primaryTextColor)
                            .font(.headline)
                        
                        VStack {
                            let prosList = car.prosList.filter({ $0 != "" })
                            ForEach(prosList, id: \.self) { pros in
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundStyle(themeManager.currentTheme.primaryColor)
                                    
                                    Text(pros)
                                        .foregroundStyle(themeManager.currentTheme.secondaryTextColor)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    })
                    
                    Spacer()
                }
                .padding([.vertical], 16)
                .padding(.leading, 24)
                
                HStack {
                    VStack(alignment: .leading, content: {
                        Text("Cons:")
                            .font(.headline)
                        
                        VStack {
                            let consList = car.consList.filter({ $0 != "" })
                            ForEach(consList, id: \.self) { cons in
                                HStack {
                                    Image(systemName: "circle.fill")
                                        .foregroundStyle(themeManager.currentTheme.primaryColor)
                                    
                                    Text(cons)
                                        .foregroundStyle(themeManager.currentTheme.secondaryTextColor)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    })
                    
                    Spacer()
                }
                .padding(.leading, 24)
            }
        }
    }
}


#Preview {
    let car = Car(consList: ["4 wheel drive", "Disc Brake", "Disc Brake"],
                  customerPrice: 200,
                  make: "Toyota",
                  marketPrice: 2000,
                  model: "Land Cruiser",
                  prosList: ["4 wheel drive", "Disc Brake", "Disc Brake"],
                  rating: 4.5)
    return CarListItemView(car: car, isExpanded: true)
        .environmentObject(ThemeManager())
}
