//
//  Encodable+Extension.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
public extension Encodable {
    func toJson() -> Data? {
        return try? Json.encoder.encode(self)
    }
}
