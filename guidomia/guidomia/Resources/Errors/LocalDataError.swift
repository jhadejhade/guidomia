//
//  LocalDataError.swift
//  Guidomia
//
//  Created by Jade Lapuz on 9/18/24.
//

import Foundation

enum LocalDataError: Error, LocalizedError {
    case fileNotFound(fileName: String)
    case decodingFailed(error: Error)
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let fileName):
            return "The file named \(fileName) was not found."
        case .decodingFailed(let error):
            return "Failed to decode the JSON data: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}
