//
//  GroupController.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class GroupsController: UIViewController {
    
    var groupsTableView = UITableView()
    var arrayGroups: [GroupDTO] = []
    let groupsServise = GroupsAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Группы"
        groupsTableView = UITableView(frame: view.bounds)
        groupsTableView.separatorStyle = .none
        
        groupsTableView.register(GroupsCell.self, forCellReuseIdentifier: GroupsCell.identifire)
        
        groupsTableView.delegate = self
        groupsTableView.dataSource = self
        
        view.addSubview(groupsTableView)
        
        groupsServise.getRequestGroups { response in
            self.arrayGroups = response
            DispatchQueue.main.async {
                self.groupsTableView.reloadData()
            }
        }
    }
}

extension GroupsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupsCell.identifire, for: indexPath) as! GroupsCell
        let groups = arrayGroups[indexPath.row]
        cell.configureFriends(photoURL: groups.photo100 ?? "1", groupsName: groups.name ?? "no name")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
