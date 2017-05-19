//
//  RightImageLeftTitleButton.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/17.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class RightImageLeftTitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let viewX:CGFloat = (self.frame.size.width - (titleLabel?.frame.size.width)! - (imageView?.frame.size.width)! - 8) / 2
        
        titleLabel?.frame.origin.x = viewX
        imageView?.frame.origin.x = (titleLabel?.frame.maxX)! + 8
    }
}
