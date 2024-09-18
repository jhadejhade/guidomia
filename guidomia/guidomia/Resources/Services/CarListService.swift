//
//  CarlistService.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

enum FileType: String {
    case json
}

protocol LocalDataLoadable {
    func loadFile<T: Codable>(forResource fileName: String, ofType type: FileType) async throws -> T
}

class CarlistService: LocalDataLoadable {
    
    struct Constants {
        /// 2 seconds delay
        static let delayInNanoseconds = UInt64(2 * 1_000_000_000)
    }
    
    static let shared = CarlistService()
    
    func loadFile<T: Codable>(forResource fileName: String, ofType type: FileType) async throws -> T {
        
        try await Task.sleep(nanoseconds: Constants.delayInNanoseconds)
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: type.rawValue) else {
            throw LocalDataError.fileNotFound(fileName: fileName)
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            
            return decodedData
        } catch {
            throw LocalDataError.decodingFailed(error: error)
        }
    }
}
