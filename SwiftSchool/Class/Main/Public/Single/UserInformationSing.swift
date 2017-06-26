//
//  UserInformationSing.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/26.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class UserInformationSing: NSObject {
     /// 年龄
     public var age = NSString()
    
     /// 唯一编号
     public var myId = NSString()
    
     /// 姓名
     public var name = NSString()
    
     /// 手机号
     public var mobile = NSString()
    
     /// 性别(0、未知；1、男；2、女；3、保密。)
     public var sex = NSString()
    
     /// 生日
     public var birthday = NSString()

     /// 照片
     public var photo = NSString()
    
     /// 归属机构
     public var attribution = NSString()
    
     /// 组织机构简称
     public var orgshortname = NSString()
    
     /// 机构编码路径
     public var path = NSString()
    
     /// 归属类型(字典：1：子公司，2：部门，20：运营商（同子公司），21：驾校，22：分校（同子公司），23：招生点（同子公司))
     public var attributiontype = NSString()
    
     /// 驾校id（若归属为运营商则无）
     public var schoolid = NSString()
    
     /// 驾校简称（若归属为运营商则无）
     public var shcoolname = NSString()
    
     /// 驾校编码路径（若归属为运营商则无）
     public var shcoolpath = NSString()
    
     /// touken
     public var tokenId = NSString()
    
     /// 登陆标示
     public var loginFlag = NSString()
    
     /// 分校列表
     public var branchList = NSMutableArray()
    
    /// 创建单例
    static var userInfo = UserInformationSing()
    
    private override init() {
       
    }
}
