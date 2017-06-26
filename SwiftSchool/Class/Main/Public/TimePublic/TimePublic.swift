//
//  TimePublic.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/23.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class TimePublic: NSObject {
    
    /// 获取当前日期
    ///
    /// - Returns: 返回时间字符串 23/5/2017
    public func getNowDate() -> String{
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        return formatter.string(from: currentDate)
    }
    
    /// 获取当前日期和时间
    ///
    /// - Returns: 返回时间字符串 2017-5-23 17:45:36
    public func getNowDateAndTime() -> String{
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: currentDate)
    }
    
    /// 获取当前年
    ///
    /// - Returns: 当前年
    public func getNow_Year() -> Int {
        return getDateAndTimeAndWeek()[0]
    }
    
    /// 获取当前月
    ///
    /// - Returns: 当前月
    public func getNow_Month() -> Int {
        return getDateAndTimeAndWeek()[1]
    }
    
    /// 获取当前天
    ///
    /// - Returns: 当前天
    public func getNow_Day() -> Int {
        return getDateAndTimeAndWeek()[2]
    }
    
    /// 获取当前小时
    ///
    /// - Returns: 当前小时
    public func getNow_Hour() -> Int {
        return getDateAndTimeAndWeek()[3]
    }
    
    /// 获取当前分钟
    ///
    /// - Returns: 当前分钟
    public func getNow_Minute() -> Int {
        return getDateAndTimeAndWeek()[4]
    }
    
    /// 获取当前秒
    ///
    /// - Returns: 当前秒
    public func getNow_Second() -> Int {
        return getDateAndTimeAndWeek()[5]
    }
    
    /// 获取当前星期几
    ///
    /// - Returns: 当前星期几
    public func getNow_Weekday() -> Int {
        return getDateAndTimeAndWeek()[6]
    }
    
    /// 获取13位的时间戳
    ///
    /// - Returns: 返回位数为14，包涵小数点后面多一个0
    public func getNowTimeStamp_13() -> Double {
        let date = Date()
        let dateStr : NSString = String(format: "%.0f", date.timeIntervalSince1970 * 1000) as NSString
        let time = dateStr.longLongValue
        return Double(time)
    }
    
    /// 获取10位的时间戳
    ///
    /// - Returns: 返回位数10位的时间戳
    public func getNowTimeStamp_10() -> Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    /// 根据时间戳返回标准格式的字符串
    ///
    /// - Parameter timeStamp: 传入的时间戳，10位或者13位都可以
    /// - Returns: 返回标准格式的字符串 2017-5-25 12:12:12
    public func timeStampSwitchDate(timeStamp:Double) -> String{
        let timeStr : NSString = String(format: "%.0f", timeStamp) as NSString
        if timeStr.length == 10 {
            let date = Date(timeIntervalSince1970: timeStamp)
            let formtter = DateFormatter()
            formtter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formtter.string(from: date)
        }else if timeStr.length == 13 {
            //获取前10位
            let timeStampStr = timeStr.substring(to: 10)
            let date = Date(timeIntervalSince1970: TimeInterval(timeStampStr)!)
            let formtter = DateFormatter()
            formtter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formtter.string(from: date)
        }else{
            return "暂无数据"
        }
    }
    
    /// 获取标准日期
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: 标准日期
    public func getDate_YYYY_MM_DD_times(timeStamp: Double) -> String{
        let timeStr : NSString = String(format: "%.0f", timeStamp) as NSString
        if timeStr.length == 13 || timeStr.length == 10 {
            let dateStr = timeStampSwitchDate(timeStamp: timeStamp)
            let array = dateStr.components(separatedBy: " ")
            return array[0]
        }else{
            return "暂无数据"
        }
        
    }
    
    /// 获取标准时间
    ///
    /// - Parameter timeStamp: 时间戳
    /// - Returns: 标准时间
    public func getTimes_HH_MM_SS_times(timeStamp: Double) -> String{
        let timeStr : NSString = String(format: "%.0f", timeStamp) as NSString
        if timeStr.length == 13 || timeStr.length == 10 {
            let dateStr = timeStampSwitchDate(timeStamp: timeStamp)
            let array = dateStr.components(separatedBy: " ")
            return array[1]
        }else{
            return "暂无数据"
        }
    }
}
extension TimePublic {
    fileprivate func getDateAndTimeAndWeek() -> [Int]{
        var timeArry:[Int] = NSMutableArray.init() as! [Int]
        let calender:Calendar = Calendar(identifier: .gregorian)
        var coms : DateComponents = DateComponents()
        coms = calender.dateComponents([.year,.month,.day,.hour,.minute,.second,.weekday,.weekOfMonth,.weekOfYear,.weekdayOrdinal,.yearForWeekOfYear], from: Date())
        timeArry.append(coms.year!)
        timeArry.append(coms.month!)
        timeArry.append(coms.day!)
        timeArry.append(coms.hour!)
        timeArry.append(coms.minute!)
        timeArry.append(coms.second!)
        timeArry.append(coms.weekday! - 1)
        return timeArry
    }
}
