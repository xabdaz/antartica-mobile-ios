//
//  AlbumViewData.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
struct AlbumViewData {
    let model: AlbumModel
    init(model: AlbumModel) {
        self.model = model
    }
}

extension AlbumViewData {
    var title: String? {
        return self.model.title
    }
}
