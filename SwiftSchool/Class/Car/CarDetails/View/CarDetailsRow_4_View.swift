//
//  CarDetailsRow_4_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/15.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarDetailsRow_4_View: UIView {
    var nameLabel = UILabel()
    var dateLabel = UILabel()
    var timeLabel = UILabel()
    var photoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let viewW = self.frame.size.width
        
        nameLabel = UILabel.init(frame: CGRect.init(x: viewW / 32, y: 5, width: 80, height: 28))
        nameLabel.text = "最近抓拍"
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(nameLabel)
        
        dateLabel = UILabel.init(frame: CGRect.init(x: nameLabel.frame.minX, y: nameLabel.frame.maxY + 3, width: nameLabel.frame.width, height: 18))
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        dateLabel.text = "2017-12-12"
        self.addSubview(dateLabel)
        
        timeLabel = UILabel.init(frame: CGRect.init(x: nameLabel.frame.minX, y: dateLabel.frame.maxY + 3, width: nameLabel.frame.width, height: 18))
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.text = "12:12:12"
        self.addSubview(timeLabel)
        
        photoImageView = UIImageView.init(frame: CGRect.init(x: nameLabel.frame.maxX + 8, y: 10, width: 60, height: 60))
        photoImageView.image = UIImage.init(named: "a_zhanwei")
        self.addSubview(photoImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
