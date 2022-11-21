//
//  ImageCache.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/15/22.
//

import Foundation

final class ImageCache {
    static let shared = ImageCache()
    
    private let cache: NSCache<NSNumber, NSData> = NSCache<NSNumber, NSData>()
    
    private init() {}
}

extension ImageCache {
    
    func set(data: Data, id: Int) {
        let key = NSNumber(value: id)
        let object = NSData(data: data)
        self.cache.setObject(object, forKey: key)
    }
    
    func get(id: Int) -> Data? {
        let key = NSNumber(value: id)
        guard let object = self.cache.object(forKey: key) else { return nil }
        print("getting Caching id: \(id)")
        return Data(referencing: object)
    }
}
