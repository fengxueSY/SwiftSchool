//
//  SwiftSchoolSingle.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/23.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class SwiftSchoolSingle: NSObject {
    static let swiftSchoolSingle = SwiftSchoolSingle()
    public var headersDic:NSDictionary = NSDictionary()

    private override init() {
        
    }
    public func changeHeaderDic() {
        let t : NSString = "123" as NSString
        let toukenID : String = (UserInformationSing.userInfo.tokenId.length > 0 ? UserInformationSing.userInfo.tokenId : t) as String
        let tagFlag : String = (UserInformationSing.userInfo.loginFlag.length > 0 ? UserInformationSing.userInfo.loginFlag : t) as String
        
        let dic = ["version":"1.0","sign":"","tokenid": toukenID,"sign_t":(0),"tag": tagFlag,"from":(300)] as NSDictionary
        let jsonData:Data = try! JSONSerialization.data(withJSONObject: dic, options: []) as Data
        let jsonStr = NSString.init(data: jsonData, encoding: String.Encoding.utf8.rawValue)
        headersDic = ["rqs-header" : jsonStr! as String]

    }
}
