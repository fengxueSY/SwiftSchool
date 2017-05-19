//
//  NavigationController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/19.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let na = UINavigationBar.appearance()
        na.barTintColor = RGBColor().rgbColor(red: 34, green: 172, blue: 56, alpha: 1)
        
        let arrDic = NSMutableDictionary.init()
        arrDic[NSFontAttributeName] = UIFont.systemFont(ofSize: 20)
        arrDic[NSForegroundColorAttributeName] = UIColor.white
        na.titleTextAttributes = arrDic as? [String : Any]
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
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
