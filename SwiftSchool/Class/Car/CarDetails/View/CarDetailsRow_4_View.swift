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
    var carDetailsModel = CarDetailsModel(){
        didSet{
            if carDetailsModel.trainphotos.count > 0 {
                let dic = carDetailsModel.trainphotos[0] as! NSDictionary
                
                dateLabel.text = TimePublic().getDate_YYYY_MM_DD_times(timeStamp: dic.object(forKey: "capturetime") as! Double)
                timeLabel.text = TimePublic().getTimes_HH_MM_SS_times(timeStamp: dic.object(forKey: "capturetime") as! Double)
                if !(dic.object(forKey: "trainphoto") as! String).isEmpty {
                    let data = NSData.init(contentsOf: URL.init(string: dic.object(forKey: "trainphoto") as! String)!)
                    if data == nil {
                        photoImageView.image = UIImage.init(named: "a_zhanwei")
                    }else{
                        photoImageView.image = UIImage.init(data: data! as Data, scale: 1)
                    }
                }else{
                    photoImageView.image = UIImage.init(named: "a_zhanwei")
                }
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let viewW = self.frame.size.width
        
        
        nameLabel = UILabel.init(frame: CGRect.init(x: viewW / 32, y: 5, width: 80, height: 28))
        nameLabel.text = "最近抓拍"
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(nameLabel)
        
        dateLabel = UILabel.init(frame: CGRect.init(x: nameLabel.frame.minX, y: nameLabel.frame.maxY + 3, width: nameLabel.frame.width, height: 18))
        dateLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(dateLabel)
        
        timeLabel = UILabel.init(frame: CGRect.init(x: nameLabel.frame.minX, y: dateLabel.frame.maxY + 3, width: nameLabel.frame.width, height: 18))
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(timeLabel)
        
        photoImageView = UIImageView.init(frame: CGRect.init(x: nameLabel.frame.maxX + 8, y: 10, width: 60, height: 60))
        
        self.addSubview(photoImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
