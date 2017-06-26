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
    var carDetailsModel = CarDetailsModel(){
        didSet{
            if carDetailsModel.photo.isEmpty {
                headImageView.image = UIImage.init(named: "005")
            }else{
                let data: NSData = NSData.init(contentsOf: URL.init(string: carDetailsModel.photo)!)!
                headImageView.image = UIImage.init(data: data as Data, scale: 1)
            }
            carNumberLabel.text = carDetailsModel.platno
            if carDetailsModel.online == 1 {
                if carDetailsModel.acc == 1 {
                    accTypeImageView.image = UIImage.init(named: "car_status_qidong")
                }else{
                    accTypeImageView.image = UIImage.init(named: "car_status_xihuo")
                }
            }else{
                accTypeImageView.image = UIImage.init(named: "car_status_lixian")
            }
            timeLabel.text = TimePublic().timeStampSwitchDate(timeStamp: Double(carDetailsModel.capturetime))
            speedLabel.text = String(format: "%.2fkm/h", CGFloat(carDetailsModel.speed / 1000))
            if carDetailsModel.businesstype == 1 {
                trainTypeImageView.image = UIImage.init(named: "car_status_peixun")
            }else{
                trainTypeImageView.image = UIImage.init(named: "car_status_kongxian")
            }
            carTypeImageView.image = UIImage.init(named: String(format: "car_status_%@", carDetailsModel.perdrivtype))
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let viewW = self.frame.size.width
        let viewH = self.frame.size.height
        
        headImageView = UIImageView.init(frame: CGRect.init(x:viewW / 32 , y: viewH / 6, width: viewW * 4 / 32, height: viewW * 4 / 32))
        self.addSubview(headImageView)
        
        carNumberLabel = UILabel.init(frame: CGRect.init(x: headImageView.frame.maxX + viewW / 32, y: viewH / 7, width: viewW / 3, height: viewH / 6))
        carNumberLabel.textColor = UIColor.blue
        carNumberLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(carNumberLabel)
        
        timeLabel = UILabel.init(frame: CGRect.init(x: carNumberLabel.frame.maxX + 5, y: carNumberLabel.frame.minY, width: viewW - carNumberLabel.frame.maxX - 15, height: viewH / 6))
        timeLabel.textColor = UIColor.black
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textAlignment = NSTextAlignment.right
        self.addSubview(timeLabel)
        
        carTypeImageView = UIImageView.init(frame: CGRect.init(x: carNumberLabel.frame.minX, y: carNumberLabel.frame.maxY + viewH / 8, width: 16, height: 16))
        self.addSubview(carTypeImageView)
        
        accTypeImageView = UIImageView.init(frame: CGRect.init(x: carTypeImageView.frame.maxX + 8, y: carNumberLabel.frame.maxY + viewH / 8, width: 30, height: viewH / 6))
        self.addSubview(accTypeImageView)
        
        trainTypeImageView = UIImageView.init(frame: CGRect.init(x: accTypeImageView.frame.maxX + 8, y: carNumberLabel.frame.maxY + viewH / 8, width: 30, height: viewH / 6))
        self.addSubview(trainTypeImageView)
        
        speedLabel = UILabel.init(frame: CGRect.init(x: trainTypeImageView.frame.maxX  + 5, y: carNumberLabel.frame.maxY + viewH / 8, width: viewW - trainTypeImageView.frame.maxX - 15, height: viewH / 6))
        speedLabel.textAlignment = NSTextAlignment.right
        speedLabel.textColor = UIColor.red
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
