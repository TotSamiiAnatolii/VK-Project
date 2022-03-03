//
//  NameUserCell.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class NameUserCell: UITableViewCell {
    
  static let identifire = "NameUserCell"
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMM 'в' HH:mm"
        return dateFormatter
    }()
    
    let imageAvatarUser: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.isSelected = false
        roundAvatar()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func roundAvatar() {
        imageAvatarUser.layer.cornerRadius = imageAvatarUser.frame.height / 2
    }
    
    func configureNameUserCell(photo: String, name: String, data: Int?) {
        imageAvatarUser.sd_setImage(with: URL(string: photo),completed: nil)
        
        nameLabel.text = name
        
        timeLabel.text = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(data!)))
    }
    
    func setConstraint() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(imageAvatarUser)
        
        NSLayoutConstraint.activate([
            imageAvatarUser.heightAnchor.constraint(equalToConstant: 50),
            imageAvatarUser.widthAnchor.constraint(equalToConstant: 50),
            imageAvatarUser.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            imageAvatarUser.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
           
            nameLabel.leadingAnchor.constraint(equalTo: imageAvatarUser.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            timeLabel.leadingAnchor.constraint(equalTo: imageAvatarUser.trailingAnchor, constant: 8),
        ])
    }
    
}
