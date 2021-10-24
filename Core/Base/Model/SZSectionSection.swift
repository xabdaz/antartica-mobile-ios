//
//  SZSectionSection.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 24/10/21.
//

import Foundation
enum SZSectionSection<ITEM> {
    case item(_ item: ITEM, identifier: String)
    case loading(identifier: String)
}
