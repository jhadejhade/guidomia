//
//  MainViewViewModel.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

protocol MainViewViewModelProtocol: ObservableObject {
    var carMake: String { get set }
    var carModel: String { get set }
}

class MainViewViewModel: MainViewViewModelProtocol {
    
    @Published var carMake: String = ""
    @Published var carModel: String = ""
    
    private var carService: LocalDataLoadable
    
    init(carService: LocalDataLoadable = CarlistService.shared) {
        self.carService = carService
    }
}
