//
//  LikeCommentCell.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class LikeCommentCell: UITableViewCell {
    
   static let identifire = "LikeCommentCell"
    
    // Create button like, comment, repost
    
    let buttonLike: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "love"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonComment: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonRepost: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "share"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
 
    // Create label count like, comment, repost
    
    let countLikeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
      
        return label
    }()
    
    let countCommentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
  
        return label
    }()
    
    let countRepostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    let countViewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
     
        return label
    }()
    
    //    Create number of views
    
    let views: UIImageView = {
        let views = UIImageView()
        views.translatesAutoresizingMaskIntoConstraints = false
        views.image = UIImage(named: "visibility")
        return views
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLikeCommentCell(countLike: Int, countComment: Int, countRepost: Int, countViews: Int) {
        countLikeLabel.text = String(countLike)
        countCommentLabel.text = String(countComment)
        countRepostLabel.text = String(countRepost)
        countViewsLabel.text = String(countViews)
    }
    
    func setConstraint() {
        
        contentView.addSubview(buttonLike)
        contentView.addSubview(buttonComment)
        contentView.addSubview(buttonRepost)
        contentView.addSubview(countLikeLabel)
        contentView.addSubview(countCommentLabel)
        contentView.addSubview(countRepostLabel)
        contentView.addSubview(views)
        contentView.addSubview(countViewsLabel)
        
        NSLayoutConstraint.activate([
            buttonLike.widthAnchor.constraint(equalToConstant: 20),
            buttonLike.heightAnchor.constraint(equalToConstant: 20),
            buttonLike.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            buttonLike.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            countLikeLabel.widthAnchor.constraint(equalToConstant: 30),
            countLikeLabel.heightAnchor.constraint(equalToConstant: 20),
            countLikeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countLikeLabel.leadingAnchor.constraint(equalTo: buttonLike.trailingAnchor, constant: 3)
            
        ])
        
        NSLayoutConstraint.activate([
            buttonComment.widthAnchor.constraint(equalToConstant: 20),
            buttonComment.heightAnchor.constraint(equalToConstant: 20),
            buttonComment.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonComment.leadingAnchor.constraint(equalTo: countLikeLabel.trailingAnchor, constant: 5)
            
        ])
        
        NSLayoutConstraint.activate([
            countCommentLabel.widthAnchor.constraint(equalToConstant: 30),
            countCommentLabel.heightAnchor.constraint(equalToConstant: 20),
            countCommentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countCommentLabel.leadingAnchor.constraint(equalTo: buttonComment.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            buttonRepost.widthAnchor.constraint(equalToConstant: 20),
            buttonRepost.heightAnchor.constraint(equalToConstant: 20),
            buttonRepost.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            buttonRepost.leadingAnchor.constraint(equalTo: countCommentLabel.trailingAnchor, constant: 3)
            
        ])
        
        NSLayoutConstraint.activate([
            countRepostLabel.widthAnchor.constraint(equalToConstant: 30),
            countRepostLabel.heightAnchor.constraint(equalToConstant: 20),
            countRepostLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countRepostLabel.leadingAnchor.constraint(equalTo: buttonRepost.trailingAnchor, constant: 3)
        ])
        
        NSLayoutConstraint.activate([
            views.widthAnchor.constraint(equalToConstant: 20),
            views.heightAnchor.constraint(equalToConstant: 20),
            views.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            views.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -35)
        ])
        
        NSLayoutConstraint.activate([
            countViewsLabel.widthAnchor.constraint(equalToConstant: 35),
            countViewsLabel.heightAnchor.constraint(equalToConstant: 20),
            countViewsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            countViewsLabel.leadingAnchor.constraint(equalTo: views.trailingAnchor, constant: 3)
        ])
    }
}
