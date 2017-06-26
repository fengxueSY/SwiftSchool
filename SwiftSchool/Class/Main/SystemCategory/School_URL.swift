//
//  School_URL.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/19.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class School_URL: NSObject {
    var isTest = true
    
    /**
     基础接口
     
     @return 根据文档里面区分，这里是业务部分：3，业务接口
     */
    func url_BaseTest() -> String {
        return isTest ? "http://base.api.owl361.com" : "http://118.178.228.221:8088/jp3.base.api"
    }
    /**
     业务接口
     
     @return 根据文档里面区分，这里是业务部分：4，业务接口
     */
    func url_BusinessTest() -> String {
        return isTest ? "http://jp.api.owl361.com" : "http://118.178.228.221:8088/jp3.bns.api"
    }
//MARK: - 登陆
    ///  获取膜和指数
    ///
    /// - Returns: 膜和指数
    func user_LoginInfo() -> String {
        return isTest ? "http://user.api.owl361.com:8080" : "http://118.178.228.221:8088/user-api"
    }
    /// 获取膜和指数
    ///
    /// - Returns: 获取膜和指数
    public func getUser_LoginInfo() -> NSString {
        return NSString(format: "%@/secret/regkey", user_LoginInfo())
    }
    
    /// 获取登陆的touken和登陆标示
    ///
    /// - Returns: touken和登陆标示
    public func getToukenAndLoginFlag() -> NSString {
        return NSString(format: "%@/app/user/syslogin", url_BaseTest())
    }
    
    /// 获取用户个人信息
    ///
    /// - Returns: 个人信息
    public func getUserInformation() -> String {
        return String(format: "%@/app/user/data", url_BaseTest())
    }

//MARK: - 首页
    /// 获取首页顶部的三个数据
    ///
    /// - Returns: 学员总数，教练总数，车辆总数
    public func getThreeDataWithHomePage() -> String {
        return String(format: "%@/app/report/masterindex", url_BusinessTest())
    }
    
    /// 获取所有的分校列表
    ///
    /// - Returns: 分校列表
    public func getAllBrsch() -> String {
        return String(format: "%@/app/organization/branch/list", url_BaseTest())
    }
    
    /// 获取招生点
    ///
    /// - Returns: 招生点列表
    public func getRecruitSchool() -> String{
        return String(format: "%@/app/organization/enroll/list", url_BaseTest())
    }
    
//MARK: - 车辆
    
    /// 车辆列表
    ///
    /// - Returns: 列表
    public func getCarsList() -> String{
        return String(format: "%@/app/vehiclereal/pagelist", url_BusinessTest())
    }
    
    /// 获取车辆详情
    ///
    /// - Returns: 详情
    public func getCarDetails() -> String{
        return String(format: "%@/app/vehiclereal/basedata", url_BusinessTest())
    }
}
