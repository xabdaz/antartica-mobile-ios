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
    
    public class User: ApiRequest<[UserModel]> {
        init() {
            super.init(resource: "/users", useSZModel: false)
        }
    }

    public class Albums: ApiRequest<[AlbumModel]> {
        init(userId: Int) {
            super.init(resource: "/albums?userId=\(userId)", useSZModel: false)
        }
    }

    public class Photo: ApiRequest<[PhotoModel]> {
        init(albumId: Int) {
            super.init(resource: "/photos?albumId=\(albumId)", useSZModel: false)
        }
    }

    public class Comment: ApiRequest<[CommentModel]> {
        init(postId: Int) {
            super.init(resource: "/posts/\(postId)/comments", useSZModel: false)
        }
    }
}
