//
//  HomepageModel.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/31.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class HomepageModel: NSObject {
    public func getHomePageThreeData() -> NSMutableDictionary {
        var reDic = NSMutableDictionary()
        reDic = NSMutableDictionary.init()
        let url : URL! = URL(string: School_URL().getThreeDataWithHomePage())
        var request : URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = SwiftSchoolSingle.swiftSchoolSingle.headersDic as? [String : String]
        let bodyDic : NSDictionary = ["orgid" : UserInformationSing.userInfo.schoolid] as NSDictionary
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = StringPublic().getHttpBodys(parm: bodyDic).data(using: .utf8)
        var response : URLResponse?
        do {
            let res = try NSURLConnection.sendSynchronousRequest(request, returning: &response)
            let dic : NSDictionary = try JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let dataDic : NSDictionary = dic.object(forKey: "data") as! CVarArg as! NSDictionary
             reDic.setValue(dataDic.object(forKey: "coaches"), forKey: "coaches")
             reDic.setValue(dataDic.object(forKey: "graduated"), forKey: "graduated")
             reDic.setValue(dataDic.object(forKey: "students"), forKey: "students")
             reDic.setValue(dataDic.object(forKey: "vehicles"), forKey: "vehicles")
        }catch let error {
            DeBugLog.printSwift(error.localizedDescription)
        }
        return reDic
    }
}
