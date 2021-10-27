//
//  ApiError.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public enum ApiError: Error {
    case requestFailed(statusCode: Int?, response: Data?)
}
