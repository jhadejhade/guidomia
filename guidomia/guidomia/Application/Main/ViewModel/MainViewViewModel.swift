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
    var cars: [Car] { get }
    
    func getList()
}

class MainViewViewModel: MainViewViewModelProtocol {
    
    @Published var carMake: String = ""
    @Published var carModel: String = ""
    @Published private(set) var cars: [Car] = []
    
    private var carService: LocalDataLoadable
    
    init(carService: LocalDataLoadable = CarlistService.shared) {
        self.carService = carService
    }
    
    func getList() {
        Task {
            cars = try await carService.loadFile(forResource: "car_list", ofType: .json)
        }
    }
}
