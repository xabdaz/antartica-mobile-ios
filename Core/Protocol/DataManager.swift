//
//  DataManager.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
public protocol DataManager {
    func get<T>(key: String, type: T.Type) -> T? where T : Codable
    func get(key: String) -> String?
    func set<T>(key: String, value: T?) where T : Codable
    func remove(key: String)
    func clear()
}
