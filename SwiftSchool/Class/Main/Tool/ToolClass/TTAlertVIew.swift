//
//  TTAlertVIew.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/6/13.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class TTAlertVIew: NSObject {
    class func TTAlert(text: String) {
        let al = UIAlertView.init(title: "提示", message: text, delegate: nil, cancelButtonTitle: "确定")
        al.show()
    }
}
