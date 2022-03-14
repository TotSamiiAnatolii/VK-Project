//
//  TestNewsAPI.swift
//  VK
//
//  Created by APPLE on 26.02.2022.
//

import Foundation

struct NewsAPI {
    
    func getgetRequestNews(completion: @escaping([ModelNews])->()){
        
        var arrayNews: [ItemNews] = []
        var arrayGroups: [Groups] = []
        var arrayProfiles:[Profiles] = []
        
        var url = URLComponents()
        url.host = "api.vk.com"
        url.path = "/method/newsfeed.get"
        url.scheme = "https"
        url.queryItems = [URLQueryItem(name: "user_id", value: Session.shared.userID),
                          URLQueryItem(name: "access_token", value: Session.shared.accesToken),
                          URLQueryItem(name: "order", value: "name"),
                          URLQueryItem(name: "count", value: "200"),
                          URLQueryItem(name: "fields", value: "photo_100"),
                          URLQueryItem(name: "v", value: "5.131")]
        
        let session = URLSession(configuration: .default)
        
        let request = URLRequest(url: url.url!)
        
        let task = session.dataTask(with: request) { data, response, error in
            
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
                let decodeItem = try JSONDecoder().decode(News.self, from: data)
                for  items in decodeItem.response.items {
                    arrayNews.append(items)
                    
                }
            } catch {
                print(error)
            }
            
            do {
                let decodeGroup = try JSONDecoder().decode(News.self, from: data)
                for items in decodeGroup.response.groups {
                    arrayGroups.append(items)
                    
                }
            } catch {
                print(error)
            }
            
            do {
                let decodeProfiles = try JSONDecoder().decode(News.self, from: data)
                for items in decodeProfiles.response.profiles {
                    arrayProfiles.append(items)
                    
                }
            } catch {
                print(error)
            }
            
            DispatchGroup().notify(queue: DispatchQueue.main) {
                
                var response: [ModelNews] = []
                
                for item in arrayNews {
                    if item.sourceID! < 0  {
                        
                        let group = arrayGroups.first{-($0.id!) == item.sourceID}
                        
                        var resultModel = ModelNews(source_ID: item.sourceID, text: item.text, photo_100: group?.photo100, name: group?.name ?? "no name", date: item.date, like: item.likes?.count, comments: item.comments?.count, reposts: item.reposts?.count, views: item.views?.count)
                        
                        item.attachments?.forEach({
                            guard let post = $0.photo else {return}
                            if let photoType = post.sizes?.first(where: {$0.type == "x"}) {
                                resultModel.width = photoType.width
                                resultModel.height = photoType.height
                                resultModel.foto = photoType.url
                            }
                            resultModel.photo = post
                        })
                        
                        response.append(resultModel)
                        
                    }
                    
                    else {
                        
                        let profile = arrayProfiles.first{$0.id == item.sourceID}
                        
                        var resultModel = ModelNews(source_ID: item.sourceID, text: item.text, photo_100: profile?.photo_100!, name: profile?.lastName ?? "no name", date: item.date, like: item.likes?.count, comments: item.comments?.count, reposts: item.reposts?.count, views: item.views?.count)
                        
                        item.attachments?.forEach({
                            guard let post = $0.photo else {return}
                            if let photoType = post.sizes?.first(where: {$0.type == "x"}) {
                                resultModel.width = photoType.width
                                resultModel.height = photoType.height
                                resultModel.foto = photoType.url
                            }
                            
                            resultModel.photo = post
                        })
                        
                        response.append(resultModel)
                    }
                }
                
                completion (response)
                
            }
        }
        task.resume()
    }
}
