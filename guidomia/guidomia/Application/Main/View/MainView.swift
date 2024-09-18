//
//  ContentView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct MainView<T: MainViewViewModelProtocol & Filterable>: View {
    
    @EnvironmentObject var themeManager: ThemeManager
    @StateObject var viewModel: T
    
    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(title: "Tacoma 2021", description: "Get your's now", image: .tacoma)
                
                ScrollView {
                    VStack {
                        FilterView(viewModel: viewModel)
                        
                        CarListView(cars: viewModel.cars)
                    }
                }
            }
            .toolbarBackground(themeManager.currentTheme.primaryColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("GUIDOMIA").font(.headline)
                        .foregroundStyle(.white)
                }
            }
            
            .onAppear {
                viewModel.getList()
            }
        }
    }
}

#Preview {
    let viewModel = MainViewViewModel()
    return MainView(viewModel: viewModel)
        .environmentObject(ThemeManager())
}
