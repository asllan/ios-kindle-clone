//
//  PageCell.swift
//  kindle-clone
//
//  Created by Ukjin Lee on 2017-06-01.
//  Copyright © 2017 ukjin. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "some text for label some text for label some text for label some text for label some text for label some text for label some text for label some text for label some text for label"
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
