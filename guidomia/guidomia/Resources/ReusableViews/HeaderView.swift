//
//  HeaderView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var description: String
    var image: ImageResource
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                
                Text(description)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
            }
            .padding()
        }
    }
}

#Preview {
    HeaderView(title: "Tacoma 2021", description: "Get your's now", image: .tacoma)
}
