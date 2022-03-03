//
//  FriendController.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class FriendsController: UIViewController {
    
    var arrayFriends: [FriendDTO] = []
    let friendsService = FriendsAPI()
    
    var friendTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friendTableView = UITableView(frame: view.bounds)
        friendTableView.separatorStyle = .none
        friendTableView.delegate = self
        friendTableView.dataSource = self
        friendTableView.register(FriendCell.self, forCellReuseIdentifier: FriendCell.identifire)
        
        view.addSubview(friendTableView)
        
        friendsService.getRequestFriends { friends in
            self.arrayFriends = friends
            DispatchQueue.main.async {
                self.friendTableView.reloadData()
            }
        }
    }
}

extension FriendsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.identifire, for: indexPath) as! FriendCell
        let friends = arrayFriends[indexPath.row]
        cell.configureFriends(photoURL: friends.photo100 ?? "1", firstName: friends.firstName, lastName: friends.lastName)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
