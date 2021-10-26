//
//  Data+Extension.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public extension Data {
    func toObject<T: Codable>(_ type: T.Type) -> T? {
        if type == VoidResponse.self {
            return VoidResponse() as? T
        }
        return try? Json.decoder.decode(type, from: self)
    }
    func toObject<T: Decodable>(type: T.Type) -> T? {
        let response = try? Json.decoder.decode(type, from: self)
        return response
    }
}
