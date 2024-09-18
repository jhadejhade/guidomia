//
//  ContentView.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

struct MainView<T: MainViewViewModelProtocol>: View {
    
    @StateObject var viewModel: T
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Tacoma 2021", description: "Get your's now", image: .tacoma)
                
                FilterView(carMake: $viewModel.carMake, carModel: $viewModel.carModel)
                
                Spacer()
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
}
