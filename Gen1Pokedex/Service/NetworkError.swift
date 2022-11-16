//
//  NetworkError.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/15/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badData
    case decodeFailure(DecodingError)
    case badStatusCode(Int)
    case serverError(Error)
    case other(Error)
    
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Invalid URL request", comment: "bad URL")
            
        case .badData:
            return NSLocalizedString("Corrupted data, please try again later.", comment: "bad data")
            
        case .decodeFailure:
            return NSLocalizedString("Unable to decode page", comment: "decode fail")
            
        case .badStatusCode(let statCode):
            return NSLocalizedString("Data could not be found or permission is not allowed. Status code: \(statCode)", comment: "bad status code")
            
        case .serverError:
            return NSLocalizedString("Server failure. The world is ending. Uninstall", comment: "server error")
            
        case .other:
            return NSLocalizedString("There is some sort of problem... somewhere... I sugguest Yu-Gi-Oh", comment: "unknown error")
        }
    }
}
