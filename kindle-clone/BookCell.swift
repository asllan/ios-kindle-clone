//
//  BookCell.swift
//  kindle-clone
//
//  Created by Ukjin Lee on 2017-06-01.
//  Copyright © 2017 ukjin. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of our cell"
        label.backgroundColor = .blue
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "This is some author for the book that we have in this row"
        label.backgroundColor = .green
        return label
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
        
        addSubview(coverImageView)
        coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
        
        addSubview(titleLable)
        titleLable.frame = CGRect(x: 66, y: 20, width: UIScreen.main.bounds.width, height: 20)
        
        addSubview(authorLabel)
        authorLabel.frame = CGRect(x: 66, y: 48, width: 200, height: 20)
    }
}
