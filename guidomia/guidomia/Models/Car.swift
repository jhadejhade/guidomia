//
//  Car.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

struct Car: Codable, Identifiable, Equatable {
    var id: String {
        String(format: "%@ %@", make, model)
    }
    
    let consList: [String]
    let customerPrice: Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating: Double
    
    var assetName: String {
        print(id.replacingOccurrences(of: " ", with: "_"))
        return id.replacingOccurrences(of: " ", with: "_")
    }
}
