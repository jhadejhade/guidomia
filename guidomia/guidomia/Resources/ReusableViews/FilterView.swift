//
//  FilterView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var carMake: String
    @Binding var carModel: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Filters")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .padding([.horizontal, .top])
                
                Spacer()
            }
            
            TextField("Any make", text: $carMake)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
            
            TextField("Any model", text: $carModel)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
        }
        .background(Color.gray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    FilterView(carMake: .constant(""), carModel: .constant(""))
}
