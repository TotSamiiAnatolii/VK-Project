//
//  FriendCell.swift
//  VK
//
//  Created by APPLE on 22.02.2022.
//

import UIKit

class FriendCell: UITableViewCell {
    
    static let identifire = "FriendCell"
    
    let photoAvatar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return image
    }()
    
    let labelNameUser: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let statusUserLabel: UILabel = {
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
    
    func configureFriends(photoURL: String, firstName: String, lastName: String) {
        photoAvatar.sd_setImage(with: URL(string: photoURL), completed: nil)
        labelNameUser.text = "\(firstName) \(lastName)"
    }
    
    func roundAvatar() {
        photoAvatar.layer.cornerRadius = photoAvatar.frame.height / 2
    }
    
    func setConstraint() {
        contentView.addSubview(photoAvatar)
        contentView.addSubview(labelNameUser)
        contentView.addSubview(statusUserLabel)
        
        NSLayoutConstraint.activate([
            photoAvatar.widthAnchor.constraint(equalToConstant: 50),
            photoAvatar.heightAnchor.constraint(equalToConstant: 50),
            photoAvatar.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            photoAvatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelNameUser.leadingAnchor.constraint(equalTo: photoAvatar.trailingAnchor, constant: 8),
            labelNameUser.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6)
        ])
        
        NSLayoutConstraint.activate([
            statusUserLabel.topAnchor.constraint(equalTo: labelNameUser.bottomAnchor, constant: 1),
            statusUserLabel.leadingAnchor.constraint(equalTo: photoAvatar.trailingAnchor, constant: 8),
        ])
    }
}
