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
    var passWordTextField = UITextField()
    var loginButton = UIButton()
    var userInfo : UserInformationSing = UserInformationSing.userInfo
    override func viewDidLoad() {
        super.viewDidLoad()
        creatBaseUI()
    }
    
    func loginAction(){
        
        /// 创建url
        let url:URL! = URL(string: School_URL().getUser_LoginInfo() as String)
        
        /// 发起
        var request:URLRequest! = URLRequest.init(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        
        /// 请求方式
        request.httpMethod = "POST"
       
        /// 创建单例，拿到请求头数据，设置请求头
        let single = SwiftSchoolSingle.swiftSchoolSingle
        single.changeHeaderDic()
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = single.headersDic as? [String : String]
        
        /// 创建请求体
        let bodyData = StringPublic().getHttpBodys(parm: ["UserName":nameTextField.text!]).data(using: .utf8)
        request.httpBody = bodyData
        
        /// 相应的参数
        var response : URLResponse?
        
        /// 发起网络请求
        do {
            let res = try NSURLConnection.sendSynchronousRequest(request, returning: &response)
            let dic : NSDictionary = try JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let code = dic["code"]
            let codeStr : NSString = String.init(format: "%@", code as! CVarArg) as NSString
            if codeStr.intValue == 200 {
                let dataDic : NSDictionary = dic["data"] as! NSDictionary
                let toukenID : NSString = dataDic["id"] as! NSString
                let toukenSecret : NSString = dataDic["secret"] as! NSString
                let toukenSecretArray : NSArray = toukenSecret.components(separatedBy: "-") as NSArray
                let timeStampStr : NSString = String.init(format: "%.0f", TimePublic().getNowTimeStamp_13()) as NSString
                let passwordMD5 = StringPublic().MD5(str: (passWordTextField.text)!)
                
                
                let nameStr : NSString = nameTextField.text! as NSString
                let dataStr = String(format: "%@@%@@%@", passwordMD5,nameStr,timeStampStr)
                let toukenStr0 = toukenSecretArray[0] as! String
                let toukenStr1 = toukenSecretArray[1] as! String
                
                let rsaStr = NSString.setPublicKey(dataStr.cString(using: .utf8), mod: toukenStr1.cString(using: .utf8), exp: toukenStr0.cString(using: .utf8))
                let rsaString = String(format: "%@@%@", rsaStr!,toukenID) as NSString
                requestToToukenAndLoginFlag(rsa: rsaString)
            }
        }catch let error {
            DeBugLog.printSwift(error.localizedDescription)
        }
    }
   
    func requestToToukenAndLoginFlag(rsa:NSString) {
        let name : NSString = nameTextField.text! as NSString
        let pass : NSString = rsa as NSString
        let ver : NSString = "123" as NSString
        let parmDic : NSDictionary = ["username":name,"password":pass,"verifycode":ver]
        let postDataBody : NSData = StringPublic().getHttpBodys(parm: parmDic).data(using: .utf8)! as NSData

        let url : URL! = URL(string: School_URL().getToukenAndLoginFlag() as String)
        var request : URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        request.httpMethod = "POST"

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = SwiftSchoolSingle.swiftSchoolSingle.headersDic as? [String : String]
        
        request.httpBody = postDataBody as Data
        var respone : URLResponse?
        do {
           let res = try! NSURLConnection.sendSynchronousRequest(request, returning: &respone)
            let dic : NSDictionary = try! JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let code = dic["code"]
            let codeStr : NSString = String.init(format: "%@", code as! CVarArg) as NSString
            if codeStr.intValue == 200 {
                let dataDic : NSDictionary = dic["data"] as! NSDictionary
                let toukenI : NSString = String.init(format: "%@", dataDic["tokenid"] as! CVarArg) as NSString
                let loginflag : NSString = String.init(format: "%@", dataDic["loginflag"] as! CVarArg) as NSString
                userInfo.tokenId = toukenI
                userInfo.loginFlag = loginflag
                SwiftSchoolSingle.swiftSchoolSingle.changeHeaderDic()
            getUserInformation()
            }
        }
    }
    func getUserInformation() {
        let url : URL! = URL.init(string: School_URL().getUserInformation())
        var request : URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 15)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = SwiftSchoolSingle.swiftSchoolSingle.headersDic as? [String : String]
        var resp : URLResponse?
        do {
            let res = try! NSURLConnection.sendSynchronousRequest(request, returning: &resp)
            let dic : NSDictionary = try! JSONSerialization.jsonObject(with: res, options: .allowFragments) as! NSDictionary
            let code : NSString = String(format: "%@", dic.object(forKey: "code") as! CVarArg) as NSString
            if code.integerValue == 200 {
                let dataDic : NSDictionary = dic.object(forKey: "data") as! NSDictionary
                
                userInfo.myId = String(format: "%@", dataDic.object(forKey: "id") as! CVarArg) as NSString
                userInfo.age = String(format: "%@", dataDic.object(forKey: "age") as! CVarArg) as NSString
                userInfo.birthday = String(format: "%@", dataDic.object(forKey: "birthday") as! CVarArg) as NSString
                userInfo.mobile = String(format: "%@", dataDic.object(forKey: "mobile") as! CVarArg) as NSString
                userInfo.photo = String(format: "%@", dataDic.object(forKey: "photo") as! CVarArg) as NSString
                userInfo.name = String(format: "%@", dataDic.object(forKey: "name") as! CVarArg) as NSString
                userInfo.orgshortname = String(format: "%@", dataDic.object(forKey: "orgshortname") as! CVarArg) as NSString
                userInfo.path = String(format: "%@", dataDic.object(forKey: "path") as! CVarArg) as NSString
                userInfo.sex =  String(format: "%@", dataDic.object(forKey: "sex") as! CVarArg) as NSString
                userInfo.shcoolname = String(format: "%@", dataDic.object(forKey: "shcoolname") as! CVarArg) as NSString
                userInfo.shcoolpath = String(format: "%@", dataDic.object(forKey: "shcoolpath") as! CVarArg) as NSString
                userInfo.attribution = String(format: "%@", dataDic.object(forKey: "attribution") as! CVarArg) as NSString
                userInfo.attributiontype = String(format: "%@", dataDic.object(forKey: "attributiontype") as! CVarArg) as NSString
                userInfo.schoolid = String(format: "%@", dataDic.object(forKey: "schoolid") as! CVarArg) as NSString
                let passwordStr : NSString = passWordTextField.text! as NSString
                let nameStr : NSString = nameTextField.text! as NSString
                SSKeychain.setPassword(passwordStr as String!, forService: appOnlyIndicate as String!, account: nameStr as String!)
                BrschList().getBrschList()
                self.present(TabBarController(), animated: true, completion: nil)
                
            }
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension LoginController{
    fileprivate func creatBaseUI(){
        
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
        nameTextField.text = "张达基"
        self.view.addSubview(nameTextField)
        
        let lineLabel = UILabel.init(frame: CGRect.init(x: WindowWidth / 16, y: nameHeadImageView.frame.maxY + 5, width: WindowWidth * 14 / 16, height: 1))
        lineLabel.backgroundColor = UIColor.lightGray
        self.view.addSubview(lineLabel)
        
        let passwordHeadImageView = UIImageView.init(frame: CGRect.init(x: WindowWidth / 16, y: nameHeadImageView.frame.maxY + 60, width: 14, height: 26))
        passwordHeadImageView.image = UIImage.init(named: "password")
        self.view.addSubview(passwordHeadImageView)
        
        passWordTextField = UITextField.init(frame: CGRect.init(x: passwordHeadImageView.frame.maxX + 15, y: passwordHeadImageView.frame.minY + 2, width: WindowWidth - passwordHeadImageView.frame.maxX - 16, height: 20))
        passWordTextField.delegate = self
        passWordTextField.font = UIFont.systemFont(ofSize: 14)
        passWordTextField.placeholder = "请输入密码"
        passWordTextField.keyboardType = UIKeyboardType.default
        passWordTextField.borderStyle = UITextBorderStyle.none
        passWordTextField.text = "123456"
        self.view.addSubview(passWordTextField)
        
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
}
