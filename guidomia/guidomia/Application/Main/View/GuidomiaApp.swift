//
//  GuidomiaApp.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import SwiftUI

@main
struct GuidomiaApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            let viewModel = MainViewViewModel()
            MainView(viewModel: viewModel)
                .environmentObject(themeManager)
        }
    }
}
