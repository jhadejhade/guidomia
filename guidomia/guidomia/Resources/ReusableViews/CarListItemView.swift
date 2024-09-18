//
//  CarListItemView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct CarListItemView: View {
    
    var car: Car
    
    var body: some View {
        HStack(alignment: .top) {
            Image(.tacoma)
                .resizable()
                .aspectRatio(3/2, contentMode: .fit)
                .frame(width: 100)
                .clipped()
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(String(format: "%@ %@", car.make, car.model))
                    .font(.headline)
                    .lineLimit(nil)  // Allow text to wrap into multiple lines
                
                Text(String(format: "Price: %@", 2000.abbreviated))
                    .font(.subheadline)
                
                StarRatingView(carRating: car.rating)
            }
            .padding(.leading, 8) 
            
            Spacer()
        }
    }
}


#Preview {
    let car = Car(consList: [],
                  customerPrice: 200,
                  make: "Toyota",
                  marketPrice: 2000,
                  model: "Land Cruiser",
                  prosList: [],
                  rating: 4.5)
    return CarListItemView(car: car)
}
