//
//  StringPublic.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/17.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class StringPublic: NSObject {
    //TODO:- 获取文字的宽度
    public func stringWidth(str:NSString,font:CGFloat,height:CGFloat) -> CGFloat {
        let strText:NSString = str
        let size = CGSize.init(width: 1000000, height: height)
        let fontDic = NSDictionary(object: UIFont.systemFont(ofSize: font), forKey: NSFontAttributeName as NSCopying)
        let strWidth = strText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: fontDic as? [String : Any], context: nil).size.width
        return strWidth
    }
    //TODO:- 获取文字的高度
    public func stringHeigt(str:NSString,font:CGFloat,width:CGFloat) -> CGFloat{
        let strText:NSString = str
        let size = CGSize.init(width: width, height: 100000)
        let fontDic = NSDictionary(object: UIFont.systemFont(ofSize: font), forKey: NSFontAttributeName as NSCopying)
        let strHeight = strText.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: fontDic as? [String : Any], context: nil).size.height
        return strHeight
    }
}
