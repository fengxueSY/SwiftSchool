//
//  Home_Up_View_Unit.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/16.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class Home_Up_View_Unit: UIView {
    var actionButton = UIButton()
    var headImageView = UIImageView()
    var nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatBaseUI()
    }
    func creatBaseUI(){
        let viewW = self.frame.size.width
        let viewH = self.frame.size.height
   
        headImageView = UIImageView.init(frame: CGRect.init(x: 25, y: 15, width: 50, height: 50))
        headImageView.layer.cornerRadius = 25
        self.addSubview(headImageView)
        
        nameLabel = UILabel.init(frame: CGRect.init(x: 0, y: headImageView.frame.maxY + 15, width: viewW, height: 20))
        nameLabel.textAlignment = NSTextAlignment.center
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(nameLabel)
        
        actionButton = UIButton.init(type: UIButtonType.custom)
        actionButton.frame = CGRect.init(x: 0, y: 0, width: viewW, height: viewH)
        actionButton.backgroundColor = UIColor.clear
        self.addSubview(actionButton)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
