//
//  Defaults.swift
//  e-learning
//
//  Created by hussein abed on 2/13/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct Defaults {
    
    static let shared = Defaults()
    private let defaults = UserDefaults.standard
    
    private init(){}
    
   
    
    func saveObject<T: Codable >(object: T, forKey: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            defaults.set(encoded, forKey: forKey)
        }
    }
    
    func getObject<T: Codable>(object: T, forKey: String, completion:@escaping (T?) -> ()) {
        if let user = defaults.object(forKey: forKey) as? Data {
            let decoder = JSONDecoder()
            if let fetchObject = try? decoder.decode(T.self, from: user) {
                completion(fetchObject)
                return
            }
            completion(nil)
            
        }
    }
    
    func removeData(forKey: String) {
        defaults.removeObject(forKey: forKey)
    }
}
