//
//  EndPoint.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 26/10/21.
//

import Foundation
public enum PostRepository {
    public class Post: ApiRequest<[PostModel]> {
        init() {
            super.init(resource: "/posts", useSZModel: false)
        }
    }
}