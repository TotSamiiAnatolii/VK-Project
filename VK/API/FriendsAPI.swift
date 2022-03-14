//
//  TestAPIFriends.swift
//  VK
//
//  Created by APPLE on 26.02.2022.
//

import Foundation

struct FriendsAPI {
    
    func getRequestFriends(completion: @escaping ([FriendDTO])->()) {
        
        var url = URLComponents()   
        url.host = "api.vk.com"
        url.path = "/method/friends.get"
        url.scheme = "https"
        url.queryItems = [URLQueryItem(name: "user_id", value: Session.shared.userID),
                          URLQueryItem(name: "access_token", value: Session.shared.accesToken),
                          URLQueryItem(name: "order", value: "name"),
                          URLQueryItem(name: "count", value: "250"),
                          URLQueryItem(name: "fields", value: "photo_100"),
                          URLQueryItem(name: "v", value: "5.131")]
        
        let session = URLSession(configuration: .default)
        
        let request = URLRequest(url: url.url!)
        
        let task = session.dataTask(with: request) {data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200 ... 300:
                    print("Status: \(response.statusCode)")
                    break
                default:
                    print("Status: \(response.statusCode)")
                }
            }
            
            guard let data = data else {return}
            
            do {
                let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                completion(friends.response.items)
            }catch {
                print(error)
            }
            
        }
        task.resume()
    }
}
