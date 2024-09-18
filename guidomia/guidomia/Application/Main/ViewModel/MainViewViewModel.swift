//
//  MainViewViewModel.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

protocol MainViewViewModelProtocol: ObservableObject {
    
}

class MainViewViewModel: MainViewViewModelProtocol {
    
    private var carService: LocalDataLoadable
    
    init(carService: LocalDataLoadable = CarlistService.shared) {
        self.carService = carService
    }
}
