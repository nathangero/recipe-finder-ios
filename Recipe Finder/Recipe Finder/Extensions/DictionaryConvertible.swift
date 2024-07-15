//
//  Codable + ext.swift
//  MyWeather
//
//  Created by Nathan Geronimo on 7/1/24.
//

import Foundation

protocol DictionaryConvertible {
    func toDictionary() throws -> [String: Any]?
}

extension DictionaryConvertible where Self: Codable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        
        guard let dict = json as? [String: Any] else {
            print("couldn't serialize", json)
            throw NSError(domain: "Serialization", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to serialize object to dictionary"])
        }
        
        return dict
    }
}
