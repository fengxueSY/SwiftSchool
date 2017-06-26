//
//  RGBColor.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/17.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

let greenBackColor:UIColor = UIColor.init(red: 32 / 255, green: 182 / 255, blue: 72 / 255, alpha: 1)

let grayLineBackColor:UIColor = UIColor.init(red: 221 / 255, green: 221 / 255, blue: 221 / 255, alpha: 1)

let greenButtonColor : UIColor = UIColor.init(red: 34, green: 172, blue: 56, alpha: 1)

class RGBColor: UIColor {
    public func rgbColor(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat) -> UIColor {
        return UIColor.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
}
