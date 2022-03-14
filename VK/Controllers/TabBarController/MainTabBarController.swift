//
//  MainTabBarController.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class MainTabBarController:  UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.tabBar.barTintColor = .white
        
        let newsVC = NewsController()
        let newsTabBarIcon = UITabBarItem()
        newsTabBarIcon.image = UIImage(named: "IconNews")
        newsVC.tabBarItem = newsTabBarIcon
        
        let friendsVC = FriendsController()
        let friendsTabBarIcon = UITabBarItem()
        friendsTabBarIcon.image = UIImage(named: "friends")
        friendsVC.tabBarItem = friendsTabBarIcon
        
        let groupsVC = GroupsController()
        let groupsTabBarIcon = UITabBarItem()
        groupsTabBarIcon.image = UIImage(named: "group")
        groupsVC.tabBarItem = groupsTabBarIcon
        
        let controller = [friendsVC, newsVC, groupsVC]
        self.viewControllers = controller
        
    }
    
}
