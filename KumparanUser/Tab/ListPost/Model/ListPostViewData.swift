//
//  ListPostViewData.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 23/10/21.
//

import Foundation
public struct ListPostViewData: Codable {
    let model: PostModel
    let userModel: [UserModel]
    public init(model: PostModel, user: [UserModel]) {
        self.model = model
        self.userModel = user
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
        if let index = userModel.firstIndex(where: { $0.id == self.model.id}) {
            let userModel = userModel[index]
            return userModel.name
        }
        return ""
    }
}
