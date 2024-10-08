//
//  CarListView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct CarListView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var expandedCarId: String?
    
    var cars: [Car]
    
    var body: some View {
        VStack {
            ForEach(cars) { car in
                VStack {
                    CarListItemView(car: car, isExpanded: expandedCarId == car.id)
                        .padding(.vertical)
                        .background(themeManager.currentTheme.secondaryBackgroundColor)
                    
                    Rectangle()
                        .frame(height: themeManager.currentTheme.lineHeight)
                        .foregroundColor(themeManager.currentTheme.primaryColor)
                        .padding(.vertical, 4)
                }
                .onTapGesture {
                    withAnimation {
                        if expandedCarId == car.id {
                            expandedCarId = nil
                        } else {
                            expandedCarId = car.id
                        }
                    }
                }
            }
        }
        .onChange(of: cars) { oldCars, newCars in
            if let firstCar = newCars.first, expandedCarId == nil {
                expandedCarId = firstCar.id
            }
        }
    }
}

#Preview {
    let cars = [Car(consList: [],
                    customerPrice: 200,
                    make: "Toyota",
                    marketPrice: 2000,
                    model: "2024",
                    prosList: [],
                    rating: 4),
                Car(consList: [],
                                customerPrice: 200,
                                make: "Toyotaa",
                                marketPrice: 2000,
                                model: "2024a",
                                prosList: [],
                                rating: 4)]
    return CarListView(cars: cars)
        .environmentObject(ThemeManager())
    
}
