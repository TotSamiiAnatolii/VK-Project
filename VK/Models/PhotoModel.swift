//
//  PhotoModel.swift
//  VK
//
//  Created by APPLE on 16.02.2022.
//

import Foundation

struct PhotoModel: Codable {
    let response: ResponsePhoto
}

struct ResponsePhoto: Codable {
    let count: Int
    let items: [PhotoDTO]
}

struct PhotoDTO: Codable {
    let albumID, id, date: Int
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
    }
}

struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
