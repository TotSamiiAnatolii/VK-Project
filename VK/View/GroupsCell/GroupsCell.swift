//
//  GroupsCell.swift
//  VK
//
//  Created by APPLE on 25.02.2022.
//

import UIKit

class GroupsCell: UITableViewCell {
    
    static let identifire = "GroupsCell"
    
    let photoAvatar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return image
    }()
    
    let labelNameGroups: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusGroupsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        roundAvatar()
        setConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFriends(photoURL: String, groupsName: String) {
        photoAvatar.sd_setImage(with: URL(string: photoURL), completed: nil)
        labelNameGroups.text = groupsName
    }
    
    func roundAvatar() {
        photoAvatar.layer.cornerRadius = photoAvatar.frame.height / 2
    }
    
    func setConstraint() {
        contentView.addSubview(photoAvatar)
        contentView.addSubview(labelNameGroups)
        //        contentView.addSubview(statusUserLabel)
        
        NSLayoutConstraint.activate([
            photoAvatar.widthAnchor.constraint(equalToConstant: 50),
            photoAvatar.heightAnchor.constraint(equalToConstant: 50),
            photoAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            photoAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelNameGroups.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            labelNameGroups.leadingAnchor.constraint(equalTo: photoAvatar.trailingAnchor, constant: 8),
            labelNameGroups.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6)
        ])
        
        //        NSLayoutConstraint.activate([
        //           statusGroupsLabel.topAnchor.constraint(equalTo: labelNameGroups.bottomAnchor, constant: 1),
        //            statusGroupsLabel.leadingAnchor.constraint(equalTo: photoAvatar.trailingAnchor, constant: 8),
        //        ])
    }
}
