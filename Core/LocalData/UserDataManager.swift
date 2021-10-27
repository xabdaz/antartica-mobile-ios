//
//  UserDataManager.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
public class UserDataManager: DataManager {
    private var data: [String:String]
    
    public init() {
        data = UserDefaults.standard
            .data(forKey: "data")?
            .toObject([String:String].self) ?? [:]
        
        Logger.info("Loaded user data: \(data.count) keys")
    }
    
    public func get<T>(key: String, type: T.Type) -> T? where T : Codable {
        let result = data[key]?.data(using: .utf8)?.toObject(type)
        return result
    }
    
    public func get(key: String) -> String? {
        return data[key]
    }
    
    public func set<T>(key: String, value: T?) where T : Codable {
        if let json = value?.toJson() {
            data[key] = String(data: json, encoding: .utf8)
            synchronize()
        }
    }
    
    public func remove(key: String) {
        data.removeValue(forKey: key)
        synchronize()
    }
    
    public func clear() {
        data.removeAll()
        synchronize()
    }
    
    private func synchronize() {
        UserDefaults.standard.set(data.toJson(), forKey: "data")
    }
}
