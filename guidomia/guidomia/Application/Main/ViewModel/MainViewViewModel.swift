//
//  MainViewViewModel.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation
import Combine

protocol MainViewViewModelProtocol: ObservableObject {
    var cars: [Car] { get }
    func getList()
}

protocol Filterable: ObservableObject {
    var carMake: String? { get set }
    var carModel: String? { get set }
    var makeFilters: [String] { get }
    var modelFilters: [String] { get }
}

class MainViewViewModel: MainViewViewModelProtocol, Filterable {
    
    @Published var carMake: String?
    @Published var carModel: String?
    @Published private(set) var cars: [Car] = []
    
    private var originalCarList: [Car] = []
    private var cancellables = Set<AnyCancellable>()
    
    var makeFilters: [String] {
        originalCarList.map({ $0.make })
    }
    
    var modelFilters: [String] {
        originalCarList.map({ $0.model })
    }
    
    private var carService: LocalDataLoadable
    
    init(carService: LocalDataLoadable = CarlistService.shared) {
        self.carService = carService
        observeFilterChanges()
    }
    
    private func observeFilterChanges() {
        Publishers.CombineLatest($carMake, $carModel)
            .sink { [weak self] (make, model) in
                DispatchQueue.main.async {
                    self?.filterCarsAndModels(make: make, model: model)
                }
            }
            .store(in: &cancellables)
    }

    private func filterCarsAndModels(make: String?, model: String?) {
        cars = originalCarList
        
        if let make = make, !make.isEmpty {
            cars = cars.filter { $0.make == make }
        }
        
        if let model = model, !model.isEmpty {
            cars = cars.filter { $0.model == model }
        }
    }

    
    @MainActor
    func getList() {
        Task {
            cars = try await carService.loadFile(forResource: "car_list", ofType: .json)
            originalCarList = cars
        }
    }
    

}
