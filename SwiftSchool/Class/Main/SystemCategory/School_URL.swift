//
//  School_URL.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/19.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class School_URL: NSObject {
    //获取膜和指数
    var user_LoginInfo = "http://user.api.owl361.com:8080"
    
    /**
     基础接口
     @return 根据文档里面区分，这里是业务部分：3，业务接口
     */
    var url_BaseTest = "http://base.api.owl361.com"
    /**
     业务接口
     
     @return 根据文档里面区分，这里是业务部分：4，业务接口
     */
    var url_BusinessTest = "http://jp.api.owl361.com"
    
    
    /// 获取膜和指数
    ///
    /// - Returns: 获取膜和指数
    public func getUser_LoginInfo() -> NSString {
        return NSString(format: "%@/secret/regkey", user_LoginInfo)
    }
}
