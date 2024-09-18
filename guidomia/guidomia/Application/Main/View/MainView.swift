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
        VStack {
            HeaderView(title: "Tacoma", description: "Get your's now", image: .tacoma)
        }
        
        Spacer()
    }
}

#Preview {
    let viewModel = MainViewViewModel()
    return MainView(viewModel: viewModel)
}
