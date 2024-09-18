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
        HStack {
            Image(.tacoma)
                .resizable()
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(String(format: "%@ %@", car.make, car.model))
                        .font(.title)
                        .lineLimit(1)
                }
                
                Text(String(format: "Price: %@", 2000.abbreviated))
                    .font(.title)
                
                HStack(spacing: 2) {
                    let carRating = car.rating
                    
                    ForEach(0..<Int(carRating), id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    if carRating.truncatingRemainder(dividingBy: 1) != 0 {
                        Image(systemName: "star.leadinghalf.fill")
                            .foregroundColor(.yellow)
                    }
                    
                    ForEach(0..<(5 - Int(ceil(carRating))), id: \.self) { _ in
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }
            }
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
                  rating: 4)
    return CarListItemView(car: car)
}
