//
//  LoginController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/12.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class LoginController: BaseViewController,UITextFieldDelegate {
    var nameTextField = UITextField()
    var passWordTextField : UITextField?
    var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatBaseUI()
    }
    func creatBaseUI(){
     
        let loginImageView = UIImageView.init(frame: CGRect.init(x: WindowWidth / 4, y: WindowHeight / 16, width: WindowWidth / 2, height: 80))
        loginImageView.image = UIImage.init(named: "logo")
        self.view.addSubview(loginImageView)
        
        
        let nameHeadImageView = UIImageView.init(frame: CGRect.init(x: WindowWidth / 16, y: WindowHeight / 4, width: 14, height: 26))
        nameHeadImageView.image = UIImage.init(named: "phone-number")
        self.view.addSubview(nameHeadImageView)
        
        nameTextField = UITextField.init(frame: CGRect.init(x: nameHeadImageView.frame.maxX + 15, y: nameHeadImageView.frame.minY + 2, width: WindowWidth - nameHeadImageView.frame.maxX - 16, height: 20))
        nameTextField.font = UIFont.systemFont(ofSize: 14)
        nameTextField.delegate = self
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.borderStyle = UITextBorderStyle.none
        nameTextField.placeholder = "请输入用户名"
        self.view.addSubview(nameTextField)
        
        let lineLabel = UILabel.init(frame: CGRect.init(x: WindowWidth / 16, y: nameHeadImageView.frame.maxY + 5, width: WindowWidth * 14 / 16, height: 1))
        lineLabel.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineLabel)
        
        let passwordHeadImageView = UIImageView.init(frame: CGRect.init(x: WindowWidth / 16, y: nameHeadImageView.frame.maxY + 60, width: 14, height: 26))
        passwordHeadImageView.image = UIImage.init(named: "password")
        self.view.addSubview(passwordHeadImageView)
        
        passWordTextField = UITextField.init(frame: CGRect.init(x: passwordHeadImageView.frame.maxX + 15, y: passwordHeadImageView.frame.minY + 2, width: WindowWidth - passwordHeadImageView.frame.maxX - 16, height: 20))
        passWordTextField?.delegate = self
        passWordTextField?.font = UIFont.systemFont(ofSize: 14)
        passWordTextField?.placeholder = "请输入密码"
        passWordTextField?.keyboardType = UIKeyboardType.default
        passWordTextField?.borderStyle = UITextBorderStyle.none
        self.view.addSubview(passWordTextField!)
        
        let lineLabel1 = UILabel.init(frame: CGRect.init(x: WindowWidth / 16, y: passwordHeadImageView.frame.maxY + 5, width: WindowWidth * 14 / 16, height: 1))
        lineLabel1.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineLabel1)

        loginButton = UIButton.init(type: UIButtonType.custom)
        loginButton.frame = CGRect.init(x: WindowWidth / 8, y:lineLabel1.frame.maxY + 60, width: WindowWidth * 6 / 8, height: 55)
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = greenBackColor
        loginButton.setTitle("确认登陆", for: UIControlState.normal)
        loginButton.addTarget(self, action: #selector(loginAction), for: UIControlEvents.touchUpInside)
        self.view.addSubview(loginButton)
    }
    func loginAction(){

        let tab = TabBarController()
        self.present(tab, animated: true, completion: nil)
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
