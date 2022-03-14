//
//  TestURL.swift
//  VK
//
//  Created by APPLE on 25.02.2022.
//

import Foundation

struct GroupsAPI {
    
    func getRequestGroups(completion: @escaping ([GroupDTO])->()) {
        
        var url = URLComponents()
        url.host = "api.vk.com"
        url.path = "/method/groups.get"
        url.scheme = "https"
        url.queryItems = [URLQueryItem(name: "user_id", value: Session.shared.userID),
                          URLQueryItem(name: "access_token", value: Session.shared.accesToken),
                          URLQueryItem(name: "extended", value: "1"),
                          URLQueryItem(name: "count", value: "20"),
                          URLQueryItem(name: "fields", value: "photo_100, type, name, screen_name"),
                          URLQueryItem(name: "v", value: "5.131")]
        
        let session = URLSession(configuration: .default)
        
        let requestGroups = URLRequest(url: url.url!)
        
        let task = session.dataTask(with: requestGroups ) {data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                case 200 ... 300 :
                    print("Status: \(response.statusCode)")
                    break
                default:
                    print("Status: \(response.statusCode)")
                }
            }
            
            guard let data = data else {return}
            
            do {
                
                let groups = try JSONDecoder().decode(GroupsModel.self, from: data)
                completion(groups.response.items)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
