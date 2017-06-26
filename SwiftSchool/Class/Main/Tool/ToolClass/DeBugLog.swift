//
//  DeBugLog.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/6/13.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class DeBugLog: NSObject {
    class func printSwift<message>(_ text: message,file: String = #file, function: String = #function, line: Int = #line) {
        #if DEBUG
        print("文件名:\((file as NSString).lastPathComponent)[行号:\(line)]: 方法:\(function) :\(text)")
        #endif
        }
}
