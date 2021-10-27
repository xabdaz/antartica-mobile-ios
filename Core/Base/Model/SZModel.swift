//
//  SZModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation

open class SZModel<DATA: Decodable>: Decodable {
    open var code: Int = 0
    open var data: DATA? = nil
    
    public init() {}
    
    private enum CodingKeys: String, CodingKey {
        case code
        case data
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try values.decodeIfPresent(Int.self, forKey: .code) ?? 0
        self.data = try values.decodeIfPresent(DATA.self, forKey: .data)
    }
    
}
