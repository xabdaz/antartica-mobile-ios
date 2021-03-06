//
//  String+Extension.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }
}
