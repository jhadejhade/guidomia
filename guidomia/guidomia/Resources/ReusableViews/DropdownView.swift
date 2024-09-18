//
//  DropdownView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct DropdownView: View {
    @Binding var filterSelection: String?
    var filters: [String]
    var placeholder: String
    
    var body: some View {
        VStack {
            Menu {
                Picker(placeholder, selection: $filterSelection) {
                    Text(placeholder)
                        .tag(String?.none)
                    
                    ForEach(filters, id: \.self) { filter in
                        Text(filter).tag(String?.some(filter))
                    }
                }
            } label: {
                HStack {
                    Text(filterSelection ?? placeholder)
                        .foregroundColor(filterSelection == nil ? .gray : .black)
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

#Preview {
    DropdownView(filterSelection: .constant(nil), filters: [], placeholder: "Any make")
}
