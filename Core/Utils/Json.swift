//
//  Json.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public enum Json {
    public static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    public static let decoder = JSONDecoder()
}
