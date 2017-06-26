//
//  CarDetailsModel.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/6/13.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarDetailsModel: NSObject {
    var attribution = NSInteger()/**<归属机构*/
    var orgshortname = String()/**<组织机构简称*/
    var path = NSInteger()/**<机构编码路径*/
    var vehicleid = NSInteger()/**<车辆ID*/
    var platno = String()/**<车牌号*/
    var photo = String()/**<车辆照片*/
    var maplongitude = Double()/**<地图经度*/
    var maplatitude = Double()/**<地图纬度*/
    var speed = Int()/**<速度 单位：米/小时*/
    var acc = NSInteger()/**<发动机状态 1：开启，2：关闭*/
    var gpsdirection = NSInteger()/**<角度*/
    var gpsmileage = NSInteger()/**<里程*/
    var alarmtype = NSInteger()/**<报警类型*/
    var online = NSInteger()/**<在线状态 1：在线，2：离线*/
    var traincoachid = String()/**<培训教练编号*/
    var traincoachname = String()/**<教练姓名*/
    var trainstudentid = String()/**<培训学员编号*/
    var trainstudentname = String()/**<学员姓名*/
    var businesstype = NSInteger()/**<业务状态 1：培训中，2：未培训*/
    var perdrivtype = String()/**<培训车型 1~16:A1,A2,A3,B1,B2,C1,C2,C3,C4,C5,D,E,F,M,N,P*/
    var assettype = NSInteger()/**<资产类型 1:自营,2:加盟*/
    var phase = NSInteger()/**<科目 1~4:科目一，科目二，科目三，科目四*/
    var deviceid = NSInteger()/**<设备id 如果为0表示未绑定设备*/
    var trainphotos = NSArray()/**<培训照片 最近五张培训照片，参见下表*/
    var gpstime = NSInteger()/**<Gps时间*/
    
    //培训照片
    var capturetime = NSInteger ()/**<抓拍时间*/
    var trainphoto = String()/**<培训照片*/
    var geoAdress = String()/**<反编译出的地址*/
    
    public func getCarDetails(parm: NSDictionary, Succeed: (_ succee: Any) -> Void, Failed: (_ fail: Any) -> Void){
        let url: URL! = URL.init(string: School_URL().getCarDetails())
        var request: URLRequest! = URLRequest.init(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = SwiftSchoolSingle.swiftSchoolSingle.headersDic as? [String : String]
        request.httpBody = StringPublic().getHttpBodys(parm: parm).data(using: .utf8)!
        var reponse : URLResponse?
        do {
            let res = try NSURLConnection.sendSynchronousRequest(request, returning: &reponse)
            let dic: NSDictionary! = try JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let code = dic.object(forKey: "code") as! NSInteger
            if code == 200 {
                let dataDic = dic.object(forKey: "data") as! NSDictionary
                if dataDic.allKeys.count > 0 {
                    let model = CarDetailsModel.init()
                    model.acc = dataDic.object(forKey: "acc") as! NSInteger
                    model.alarmtype = dataDic.object(forKey: "alarmtype") as! NSInteger
                    model.assettype = dataDic.object(forKey: "assettype") as! NSInteger
                    model.attribution = dataDic.object(forKey: "attribution") as! NSInteger
                    model.businesstype = dataDic.object(forKey: "businesstype") as! NSInteger
                    model.deviceid = dataDic.object(forKey: "deviceid") as! NSInteger
                    model.gpsdirection = dataDic.object(forKey: "gpsdirection") as! NSInteger
                    model.gpsmileage = dataDic.object(forKey: "gpsmileage") as! NSInteger
                    model.gpstime = dataDic.object(forKey: "gpstime") as! NSInteger
                    model.maplatitude = dataDic.object(forKey: "maplatitude") as! Double
                    model.maplongitude = dataDic.object(forKey: "maplongitude") as! Double
                    model.online = dataDic.object(forKey: "online") as! NSInteger
                    model.orgshortname = dataDic.object(forKey: "orgshortname") as! String
                    model.path = dataDic.object(forKey: "path") as! NSInteger
                    model.perdrivtype = dataDic.object(forKey: "perdrivtype") as! String
                    model.phase = dataDic.object(forKey: "phase") as! NSInteger
                    model.photo = dataDic.object(forKey: "photo") as! String
                    model.platno = dataDic.object(forKey: "platno") as! String
                    model.traincoachid = dataDic.object(forKey: "traincoachid") as! String
                    model.traincoachname = dataDic.object(forKey: "traincoachname") as! String
                    model.trainphotos = dataDic.object(forKey: "trainphotos") as! NSArray
                    model.trainstudentid = dataDic.object(forKey: "trainstudentid") as! String
                    model.trainstudentname = dataDic.object(forKey: "trainstudentname") as! String
                    model.vehicleid = dataDic.object(forKey: "vehicleid") as! NSInteger
                    Succeed(model)
                }else{
                    Failed("服务器错误")
                }
            }else{
                Failed("获取数据失败")
            } 
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
