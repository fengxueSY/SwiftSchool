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
    var leftItem = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        creaBabarItem()
    }
    func creaBabarItem(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(goBack))
        if self.isEqual(self.navigationController?.viewControllers[0]) {
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.hidesBackButton = true
        }
    }
    func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
