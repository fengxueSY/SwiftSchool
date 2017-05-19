//
//  Home_Up_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/16.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class Home_Up_View: UIView {
    
    var imageArray = ["home-img-student","home-img-coach","home-img-car"]
    var titleArray = ["学员","教练","车辆"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let viewW:Float = Float(self.frame.size.width)
        let unitW:Float = Float((viewW - 300) / 4)
        
        self.backgroundColor = greenBackColor
        
        for i in 0 ..< 3  {
            let homeViewUnit = Home_Up_View_Unit.init(frame: CGRect.init(x: Int(Float(Float(unitW * Float(i + 1) + Float(100 * i)))), y: 50, width: 100, height: 100))
            homeViewUnit.actionButton.tag = i + 19000
            homeViewUnit.headImageView.image = UIImage.init(named: imageArray[i])
            homeViewUnit.nameLabel.text = titleArray[i]
            homeViewUnit.actionButton .addTarget(self, action:#selector(buttonAction(sender:)), for: UIControlEvents.touchUpInside)
            self.addSubview(homeViewUnit)
        }
        
    }
    func buttonAction(sender:UIButton) {
        if sender.tag == 19000 {
            //学员
        }
        if sender.tag == 19000 {
            //教练
        }
        if sender.tag == 19000 {
            //车辆
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
