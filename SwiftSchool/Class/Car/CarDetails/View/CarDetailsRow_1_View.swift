//
//  CarDetailsRow_1_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/15.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarDetailsRow_1_View: UIView {
    var studentHeadImageView = UIImageView()
    var coachHeadImageView = UIImageView()
    var studentNameLabel = UILabel()
    var coachNameLabel = UILabel()
    var lineLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let viewW = self.frame.size.width
        let viewH = self.frame.size.height
     
        coachHeadImageView = UIImageView.init(frame: CGRect.init(x: viewW / 32, y: 10, width: 30, height: 30))
        coachHeadImageView.image = UIImage.init(named: "car_detail_coach")
        self.addSubview(coachHeadImageView)
        
        coachNameLabel = UILabel.init(frame: CGRect.init(x: coachHeadImageView.frame.maxX + 5, y: 10, width: viewW / 2 - 35 - viewW / 32, height: 30))
        coachNameLabel.font = UIFont.systemFont(ofSize: 14)
        coachNameLabel.text = "教练:萧炎"
        self.addSubview(coachNameLabel)
        
        lineLabel = UILabel.init(frame: CGRect.init(x: viewW / 2 - 1, y: 0, width: 1, height: viewH))
        lineLabel.backgroundColor = UIColor.gray
        self.addSubview(lineLabel)
        
        studentHeadImageView = UIImageView.init(frame: CGRect.init(x: lineLabel.frame.maxX + viewW / 32, y: 10, width: 30, height: 30))
        studentHeadImageView.image = UIImage.init(named: "car_detail_student")
        self.addSubview(studentHeadImageView)
        
        studentNameLabel = UILabel.init(frame: CGRect.init(x: studentHeadImageView.frame.maxX + 5, y: 10, width: viewW / 2 - 35 - viewW / 32, height: 30))
        studentNameLabel.font = UIFont.systemFont(ofSize: 14)
        studentNameLabel.text = "学员:牧尘"
        self.addSubview(studentNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
