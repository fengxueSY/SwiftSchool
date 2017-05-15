//
//  TopSiftView.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/12.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class TopSiftView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let firstButton = UIButton.init(type: UIButtonType.custom)
        firstButton.setTitle("first", for: UIControlState.normal)
        firstButton.backgroundColor = UIColor.white
        firstButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        firstButton.frame = CGRect.init(x: 0, y: 0, width: WindowWidth / 4, height: 50)
        self.addSubview(firstButton)
        
        let secondaryButton = UIButton.init(type: UIButtonType.custom)
        secondaryButton.setTitle("secondary", for: UIControlState.normal)
        secondaryButton.backgroundColor = UIColor.white
        secondaryButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        secondaryButton.frame = CGRect.init(x: WindowWidth / 4, y: 0, width: WindowWidth / 4, height: 50)
        self.addSubview(secondaryButton)
        
        let thirdButton = UIButton.init(type: UIButtonType.custom)
        thirdButton.setTitle("third", for: UIControlState.normal)
        thirdButton.backgroundColor = UIColor.white
        thirdButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        thirdButton.frame = CGRect.init(x: WindowWidth * 2 / 4, y: 0, width: WindowWidth / 4, height: 50)
        self.addSubview(thirdButton)
        
        let fourButton = UIButton.init(type: UIButtonType.custom)
        fourButton.setTitle("four", for: UIControlState.normal)
        fourButton.backgroundColor = UIColor.white
        fourButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        fourButton.frame = CGRect.init(x: WindowWidth * 3 / 4, y: 0, width: WindowWidth / 4, height: 50)
        self.addSubview(fourButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("");
    }
}
