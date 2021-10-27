//
//  UserViewData.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public struct UserViewData: Codable {
    public let model: UserModel
    public init(model: UserModel) {
        self.model = model
    }

}
public extension UserViewData {
    var name: String? {
        self.model.name
    }
}
