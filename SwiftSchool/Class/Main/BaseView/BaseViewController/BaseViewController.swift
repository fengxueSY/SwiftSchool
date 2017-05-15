//
//  BaseViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//


let WindowHeight = UIScreen.main.applicationFrame.size.height
let WindowWidth = UIScreen.main.applicationFrame.size.width

import UIKit


class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    public func returnStr() -> String {
        return "这里是传之久远"
    }
}
