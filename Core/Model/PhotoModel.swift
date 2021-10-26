//
//  PhotoModel.swift
//  KumparanUser
//
//  Created by Developer Xabdaz on 27/10/21.
//

import Foundation
public struct PhotoModel: Codable {
    public let albumId, id: Int?
    public let title, url, thumbnailUrl: String?
}
