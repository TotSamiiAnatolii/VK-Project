//
//  TextPostCell.swift
//  VK
//
//  Created by APPLE on 12.02.2022.
//

import UIKit

class TextPostCell: UITableViewCell {
    
    static let identifire = "TextPostCell"
    
    let postText: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePostText(textFroPost: String) {
        postText.text = textFroPost
        
    }
    
    func setConstraint()  {
        
        contentView.addSubview(postText)
        
        NSLayoutConstraint.activate([
            postText.topAnchor.constraint(equalTo: contentView.topAnchor),
            postText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postText.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            postText.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            postText.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
        ])
    }
}
