//
//  Home_Down_CollectionCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/17.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
class Home_Down_CollectionCell: UICollectionViewCell {
    var upNumberLabel = UILabel()
    var midLabel = UILabel()
    var lineLabel = UILabel()
    var downDateLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        upNumberLabel = UILabel.init()
        upNumberLabel.textAlignment = NSTextAlignment.center
        upNumberLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(upNumberLabel)
        
        midLabel = UILabel.init()
        midLabel.backgroundColor = greenBackColor
        self.addSubview(midLabel)
        
        lineLabel = UILabel.init(frame: CGRect.init(x: 0, y: self.frame.size.height - 21, width: self.frame.size.width, height: 1))
        lineLabel.backgroundColor = grayLineBackColor
        self.addSubview(lineLabel)
        
        downDateLabel = UILabel.init(frame: CGRect.init(x: 0, y: lineLabel.frame.maxY, width: self.frame.size.width, height: 20))
        downDateLabel.textAlignment = NSTextAlignment.center
        downDateLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(downDateLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
