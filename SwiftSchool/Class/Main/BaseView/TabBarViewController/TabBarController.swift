//
//  TabBarController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatBaseUI()
    }
    func creatBaseUI(){
        let home = HomeViewController()
        let homeN = UINavigationController.init(rootViewController: home)
        homeN.tabBarItem.title = "主页"
        homeN.tabBarItem.image = UIImage(named: "home-icon-home-invalid");
        homeN.tabBarItem.selectedImage = UIImage(named: "home-icon-home-click")
        self.addChildViewController(homeN)
        
        let car = CarViewController()
        let carN = UINavigationController.init(rootViewController: car)
        carN.tabBarItem.image = UIImage(named: "home-icon-car-invalid")
        carN.tabBarItem.selectedImage = UIImage(named: "home-icon-car-click")
        carN.tabBarItem.title = "车辆"
        self.addChildViewController(carN)
        
        let list = ListViewController()
        let listN = UINavigationController.init(rootViewController: list)
        listN.tabBarItem.image = UIImage(named: "home-icon-baobiao-on-拷贝")
        listN.tabBarItem.selectedImage = UIImage(named: "home-icon-baobiao-click")
        listN.tabBarItem.title = "报表"
        self.addChildViewController(listN)
        
        let mySelf = MySelfViewController()
        let mySelfN = UINavigationController.init(rootViewController: mySelf)
        mySelfN.tabBarItem.image = UIImage(named: "home-icon-user-click")
        mySelfN.tabBarItem.selectedImage = UIImage(named: "home-icon-user-invalid")
        mySelfN.tabBarItem.title = "我的"
        self.addChildViewController(mySelfN)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
