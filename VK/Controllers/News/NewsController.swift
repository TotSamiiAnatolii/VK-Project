//
//  NewsController.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit
import SDWebImage

enum Cell: Int {
    case nameuser
    case textpost
    case photopost
    case likecomment
}

class NewsController: UIViewController {
   
    var newsArray:[ModelNews] = []
    let newsService = NewsAPI()
    var newsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новости"
        newsTableView = UITableView(frame: view.bounds)
        newsTableView.separatorStyle = .none

        newsTableView.register(NameUserCell.self, forCellReuseIdentifier: NameUserCell.identifire)
        
        newsTableView.register(TextPostCell.self, forCellReuseIdentifier: TextPostCell.identifire)
        
        newsTableView.register(PhotoPost.self, forCellReuseIdentifier: PhotoPost.identifire)
        
        newsTableView.register(LikeCommentCell.self, forCellReuseIdentifier: LikeCommentCell.identifire)
        
    
        view.addSubview(newsTableView)
        newsTableView.delegate = self
        newsTableView.dataSource = self

        newsService.getgetRequestNews { news in
            self.newsArray = news
            self.newsTableView.reloadData()
        }
    
        
    }
   
}

extension NewsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellEnum = Cell(rawValue: indexPath.row)
        
        switch cellEnum {
        
        case .nameuser:
            let cell = tableView.dequeueReusableCell(withIdentifier: NameUserCell.identifire, for: indexPath) as! NameUserCell
            let nameUser = newsArray[indexPath.section].name
            let photoUser = newsArray[indexPath.section].photo_100
            let data = newsArray[indexPath.section].date
            cell.configureNameUserCell(photo: photoUser ?? "1", name: nameUser, data: data)
            return cell
            
        case .textpost:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextPostCell.identifire, for: indexPath) as! TextPostCell
            let postText = newsArray[indexPath.section].text
            cell.configurePostText(textFroPost: postText ?? "")
            return cell
            
        case .photopost:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoPost.identifire, for: indexPath) as! PhotoPost
            let photo = newsArray[indexPath.section].foto ?? "1"
            cell.configurePhotoPost(photo: photo)
            return cell
            
        case .likecomment:
            let cell = tableView.dequeueReusableCell(withIdentifier: LikeCommentCell.identifire, for: indexPath) as! LikeCommentCell
            let likeCommentCell = newsArray[indexPath.section]
            
            cell.configureLikeCommentCell(countLike: likeCommentCell.like ?? 0, countComment: likeCommentCell.comments ?? 0, countRepost: likeCommentCell.reposts ?? 0, countViews: likeCommentCell.views ?? 0)
           return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cellEnum = Cell(rawValue: indexPath.row)
        
        switch cellEnum {
        
        case .nameuser:
            return 60
        case .likecomment:
            return 40

        case .photopost:
            if let wight = newsArray[indexPath.section].width, let height = newsArray[indexPath.section].height {
                let rotation = height / wight
                return UIScreen.main.bounds.width * CGFloat(rotation)
            }
            return 0
            
        default:
            return tableView.rowHeight
        }
        
    }

}
