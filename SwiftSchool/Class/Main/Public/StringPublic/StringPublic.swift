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
    //TODO:- 返回请求体的格式
    public func getHttpBodys(parm:NSDictionary) -> String {
        var reStr = String()
        let reData : NSData = try! JSONSerialization.data(withJSONObject: parm, options: JSONSerialization.WritingOptions(rawValue: 0)) as NSData
        reStr = NSString.init(data: reData as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return reStr
    }
    //TODO:- MD5 加密字符串
    public func MD5(str:String) ->String{
        let cStr = str.cString(using: String.Encoding.utf8)
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str, CC_LONG(strlen(cStr)), result)
        let retStr = NSMutableString()
        for i in 0..<digestLen {
            retStr.appendFormat("%02x", result[i])
        }
        
        result.deallocate(capacity: digestLen)

        return retStr as String
    }
}
