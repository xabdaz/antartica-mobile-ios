//
//  CommentModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation

public struct CommentModel: Codable {
    public let postId, id: Int?
    public let name, email, body: String?
}
    
