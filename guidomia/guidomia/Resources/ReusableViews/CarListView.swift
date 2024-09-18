//
//  CarListView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct CarListView: View {
    
    var cars: [Car]
    
    var body: some View {
        List(cars) { list in
            Text(list.id)
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
                    rating: 4)]
    return CarListView(cars: cars)
    
}
