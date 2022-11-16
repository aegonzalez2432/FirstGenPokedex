//
//  ConstructPokedex.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/13/22.
//

import Foundation

struct ConstructPokedex: Decodable {
    let count: Int
    let nextPage: String?
    let previousPage: String?
    let results: [NameLink]
    
//    enum CodingKeys: String, CodingKey {
//        
//        
//        case count, next, previous, results
//        
//        
//    }
}

struct NameLink: Decodable {
    let name: String
    let url: String
}
