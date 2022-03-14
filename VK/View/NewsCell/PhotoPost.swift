//
//  PhotoPost.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class PhotoPost: UITableViewCell {
    
   static let identifire = "PhotoPost"
    
    let imagePhotoPost: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePhotoPost(photo: String) {
        imagePhotoPost.sd_setImage(with:URL(string: photo) , completed: nil)
    }
    
    func setConstraint() {
        contentView.addSubview(imagePhotoPost)
        
        NSLayoutConstraint.activate([
            imagePhotoPost.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imagePhotoPost.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            imagePhotoPost.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagePhotoPost.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imagePhotoPost.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imagePhotoPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
