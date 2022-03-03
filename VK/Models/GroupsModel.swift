//
//  Groups.swift
//  VK
//
//  Created by APPLE on 16.02.2022.
//

import Foundation

struct GroupsModel: Codable {
    let response: ResponseGroups
}

struct ResponseGroups: Codable {
    let count: Int
    let items: [GroupDTO]
}

struct GroupDTO: Codable {
    let id: Int?
    let screenName: String?
    let isClosed: Int?
    let name: String?
    let type: String?
    let photo100: String?

    enum CodingKeys: String, CodingKey {
        case id
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case name, type
        case photo100 = "photo_100"
    }
}
