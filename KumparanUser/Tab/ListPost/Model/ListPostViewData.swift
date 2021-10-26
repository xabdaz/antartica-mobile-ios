//
//  ListPostViewData.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import Foundation
public struct ListPostViewData: Codable {
    let model: PostModel
    public init(model: PostModel) {
        self.model = model
    }
}

extension ListPostViewData {
    var title: String? {
        return model.title
    }

    var description: String? {
        return model.body
    }

    var user: String? {
        return "User"
    }
}
