//
//  ThemeManager.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme = Theme.light
    
    func switchToLightTheme() {
        currentTheme = .light
    }
    
    func switchToDarkTheme() {
        currentTheme = .dark
    }
}
