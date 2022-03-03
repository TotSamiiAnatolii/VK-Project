//
//  NewsModel.swift
//  VK
//
//  Created by APPLE on 16.02.2022.
//

import Foundation
struct PhotoPostInCell {
    let sizes : [Sizes]?
}

//Результирующая модель
struct ModelNews {
    let source_ID: Int?
    let text: String?
    let photo_100: String?
    let name: String
    let date: Int?
    let like: Int?
    let comments: Int?
    let reposts: Int?
    let views: Int?
    var photo: PhotoPostModel?
    var foto: String?
    var width: Int?
    var height: Int?
    
}

struct News: Codable {
    let response: ResponseNews
}

struct ResponseNews: Codable {
    let items: [ItemNews]
    let groups: [Groups]
    let profiles: [Profiles]
}

struct Groups: Codable {
    let id: Int?
    let name: String?
    let photo100: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        
        case photo100 = "photo_100"
        
    }
}

struct ItemNews: Codable{
    let text: String?
    let sourceID: Int?
    let date: Int?
    let likes: Likes?
    let comments: Comments?
    let reposts: Reposts?
    let views: Views?
    let attachments: [Attachment]?
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date
        case text
        case likes
        case comments
        case reposts
        case views
        case attachments
        
    }
}

struct Attachment: Codable {
    let photo : PhotoPostModel?
    
}

struct PhotoPostModel: Codable {
    
    let sizes : [Sizes]?
    
}

struct Sizes: Codable {
    let type: String?
    let url: String?
    let width: Int?
    let height: Int?
}

struct Photo: Codable {
    let type: String?
    let url: String?
    let width: Int?
    let height: Int?
}

struct Views: Codable {
    let count: Int
}

struct Reposts: Codable {
    let count, userReposted: Int
    
    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

struct Comments: Codable {
    let canPost, count: Int
    
    enum CodingKeys: String, CodingKey {
        case canPost = "can_post"
        case count
    }
}

struct Profiles: Codable {
    let id: Int
    let firstName: String?
    let lastName: String?
    let photo_100: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo_100 = "photo_100"
    }
}

struct Likes: Codable {
    let canLike, count, userLikes, canPublish: Int
    
    enum CodingKeys: String, CodingKey {
        case canLike = "can_like"
        case count
        case userLikes = "user_likes"
        case canPublish = "can_publish"
    }
}
