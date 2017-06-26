//
//  RecruitPlaceModel.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/6/1.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class RecruitPlaceModel: NSObject {
    var id = NSInteger()
    var inscode = String()
    var path = String()
    var shortcode = String()
    var shortname = String()
    public func getRecruitListParm(parm : Any, succee: (_ succeed : Any) -> (), fail: (_ failed : Any) -> ()) -> (){
        
        
        let url : URL! = URL(string: School_URL().getRecruitSchool())
        var request : URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = SwiftSchoolSingle.swiftSchoolSingle.headersDic as? [String : String]
        request.httpBody = StringPublic().getHttpBodys(parm: parm as! NSDictionary).data(using: .utf8)
        var response : URLResponse?
        do {
            let res = try NSURLConnection.sendSynchronousRequest(request, returning: &response)
            let dic : NSDictionary = try JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let code : NSInteger = dic.object(forKey: "code") as! NSInteger
            if code == 200 {
                let dataArray : NSArray = dic.object(forKey: "data") as! NSArray
                if dataArray.count > 0 {
                    let successArray = NSMutableArray.init()
                    for dataDic in dataArray {
                        let model = RecruitPlaceModel.init()
                        model.id = (dataDic as! NSDictionary).object(forKey: "id") as! NSInteger
                        let ins = (dataDic as! NSDictionary).object(forKey: "inscode") as? NSString
                        if ins != nil {
                            model.inscode = ins! as String
                        }else{
                            model.inscode = ""
                        }
                        model.path = (dataDic as! NSDictionary).object(forKey: "path") as! String
                        model.shortcode = (dataDic as! NSDictionary).object(forKey: "shortcode") as! String
                        model.shortname = (dataDic as! NSDictionary).object(forKey: "shortname") as! String
                        successArray.add(model)
                    }
                    let model0 = RecruitPlaceModel.init()
                    model0.id = -1
                    model0.inscode = ""
                    model0.path = ""
                    model0.shortcode = ""
                    model0.shortname = "全部"
                    successArray.insert(model0, at: 0)
                    succee(successArray)
                }else{
                    fail("暂无数据")
                }
            }
        } catch let err {
            print(err.localizedDescription)
        }

    }
    
    func loadData(completion: @escaping (_ result:[String]) -> ()) -> () {
        
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            
            //获取到的json结果数据
            let json = ["姓名","年龄","爱好"]
            
            //主队列回调
            DispatchQueue.main.async {
                print("主线程更新 UI \(Thread.current)")
                
                //回调异步获取的结果
                completion(json)
            }
        }
    }
}
