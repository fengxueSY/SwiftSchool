//
//  CarDetailsRow_0_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/15.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarDetailsRow_0_View: UIView {
    var headImageView = UIImageView()
    var carNumberLabel = UILabel()
    var timeLabel = UILabel()
    var carTypeImageView = UIImageView()
    var accTypeImageView = UIImageView()
    var trainTypeImageView = UIImageView()
    var speedLabel = UILabel()
    var addressImageView = UIImageView()
    var addressLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let viewW = self.frame.size.width
        let viewH = self.frame.size.height
        
        headImageView = UIImageView.init(frame: CGRect.init(x:viewW / 32 , y: viewH / 6, width: viewW * 4 / 32, height: viewW * 4 / 32))
        headImageView.image = UIImage.init(named: "005")
        self.addSubview(headImageView)
        
        carNumberLabel = UILabel.init(frame: CGRect.init(x: headImageView.frame.maxX + viewW / 32, y: viewH / 7, width: viewW / 3, height: viewH / 6))
        carNumberLabel.text = "豫P88888"
        carNumberLabel.textColor = UIColor.blue
        carNumberLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(carNumberLabel)
        
        timeLabel = UILabel.init(frame: CGRect.init(x: carNumberLabel.frame.maxX + 5, y: carNumberLabel.frame.minY, width: viewW - carNumberLabel.frame.maxX - 15, height: viewH / 6))
        timeLabel.textColor = UIColor.black
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textAlignment = NSTextAlignment.right
        timeLabel.text = "2017-5-15 12:12:12"
        self.addSubview(timeLabel)
        
        carTypeImageView = UIImageView.init(frame: CGRect.init(x: carNumberLabel.frame.minX, y: carNumberLabel.frame.maxY + viewH / 8, width: 16, height: 16))
        carTypeImageView.image = UIImage.init(named: "car_status_A1")
        self.addSubview(carTypeImageView)
        
        accTypeImageView = UIImageView.init(frame: CGRect.init(x: carTypeImageView.frame.maxX + 8, y: carNumberLabel.frame.maxY + viewH / 8, width: 30, height: viewH / 6))
        accTypeImageView.image = UIImage.init(named: "car_status_qidong")
        self.addSubview(accTypeImageView)
        
        trainTypeImageView = UIImageView.init(frame: CGRect.init(x: accTypeImageView.frame.maxX + 8, y: carNumberLabel.frame.maxY + viewH / 8, width: 30, height: viewH / 6))
        trainTypeImageView.image = UIImage.init(named: "car_status_peixun")
        self.addSubview(trainTypeImageView)
        
        speedLabel = UILabel.init(frame: CGRect.init(x: trainTypeImageView.frame.maxX  + 5, y: carNumberLabel.frame.maxY + viewH / 8, width: viewW - trainTypeImageView.frame.maxX - 15, height: viewH / 6))
        speedLabel.textAlignment = NSTextAlignment.right
        speedLabel.textColor = UIColor.red
        speedLabel.text = "133.05km/h"
        speedLabel.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(speedLabel)
        
        addressImageView = UIImageView.init(frame: CGRect.init(x: carNumberLabel.frame.minX, y: carTypeImageView.frame.maxY + viewH / 8 , width: 15, height: 15))
        addressImageView.image = UIImage.init(named: "book_shifazhan")
        self.addSubview(addressImageView)
        
        addressLabel = UILabel.init(frame: CGRect.init(x: addressImageView.frame.maxX + 8, y: carTypeImageView.frame.maxY + viewH / 8, width: viewW - addressImageView.frame.maxX - 16, height: viewH / 6))
        addressLabel.text = "广州市天河区高浦路软件路口"
        addressLabel.font = UIFont.systemFont(ofSize: 14)
        addressLabel.textColor = UIColor.black
        self.addSubview(addressLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
