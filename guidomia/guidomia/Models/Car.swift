//
//  Car.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

struct Car: Codable, Identifiable {
    var id: String {
        make + model
    }
    
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating: Double
}
