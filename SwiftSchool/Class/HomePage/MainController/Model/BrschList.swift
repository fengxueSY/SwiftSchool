//
//  BrschList.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/6/1.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class BrschList: NSObject {
    var id = NSInteger()
    var path = String()
    var shortname = String()
    var shortcode = String()
    
    public func getBrschList() {
        let url : URL! = URL(string: School_URL().getAllBrsch())
        var requset : URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        requset.httpMethod = "POST"
        requset.allHTTPHeaderFields = SwiftSchoolSingle.swiftSchoolSingle.headersDic as? [String : String]
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")

        var response : URLResponse?
        do {
            let res = try NSURLConnection.sendSynchronousRequest(requset, returning: &response)
            let dic : NSDictionary = try JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let dataArray = dic.object(forKey: "data") as! NSArray
            let allBrschArray = NSMutableArray.init()
            for i in 0 ..< dataArray.count {
                let dic0 = dataArray[i] as! NSDictionary
                let model = BrschList.init()
                model.id = NSInteger(dic0.object(forKey: "id") as! NSNumber)
                model.path = dic0.object(forKey: "path") as! String
                model.shortname = dic0.object(forKey: "shortname") as! String
                model.shortcode = dic0.object(forKey: "shortcode") as! String
                allBrschArray.add(model)
            }
            let model0 = BrschList.init()
            model0.id = -1
            model0.path = ""
            model0.shortname = "全部"
            model0.shortcode = ""
            allBrschArray.insert(model0, at: 0)
            UserInformationSing.userInfo.branchList = allBrschArray
        }catch let err{
            print(err.localizedDescription)
        }
    }
}
