//
//  PostModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation

public struct PostModel: Codable {
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let body: String?

    private enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        self.id = try values.decodeIfPresent(Int.self, forKey: .id)
        self.title = try values.decodeIfPresent(String.self, forKey: .title)
        self.body = try values.decodeIfPresent(String.self, forKey: .body)
    }
}
