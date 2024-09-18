//
//  FilterView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct FilterView<T: Filterable>: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    @ObservedObject var viewModel: T
    
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
            
            DropdownView(filterSelection: $viewModel.carMake, filters: viewModel.makeFilters, placeholder: "Any make")
            
            DropdownView(filterSelection: $viewModel.carModel, filters: viewModel.modelFilters, placeholder: "Any model")
        }
        .background(themeManager.currentTheme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}

#Preview {
    FilterView(viewModel: MainViewViewModel())
        .environmentObject(ThemeManager())
}
