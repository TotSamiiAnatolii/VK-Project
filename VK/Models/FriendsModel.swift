//
//  FriendsModel.swift
//  VK
//
//  Created by APPLE on 16.02.2022.
//

import Foundation

struct FriendsModel: Codable {
    let response: ResponseFriends
}

struct ResponseFriends: Codable {
    let count: Int
    let items: [FriendDTO]
}

struct FriendDTO: Codable {
    let canAccessClosed: Bool?
    let id: Int
    let photo100: String?
    let lastName, trackCode: String
    let isClosed: Bool?
    let firstName: String
    
    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case trackCode = "track_code"
        case isClosed = "is_closed"
        case firstName = "first_name"
    }
}
