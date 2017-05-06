//
//  CarViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
 let cellID = "ID"
class CarViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var _carTableView = UITableView()
    var _dataArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆"
        creatBaseUI()
//        synchronousGet()
        synchronousPost()
//        getDataHttps()
    }
    //MARK -  https
    func getDataHttps(){
        let path = "http://js.yixc.com/jp2ass.api/monitor/vehicle-positions2"
        let parmDic:NSMutableDictionary = NSMutableDictionary()
        parmDic["corgid"] = "111"
        parmDic["orgid"] = "75"
        parmDic["pageindex"] = 1
        parmDic["subject"] = 0
        parmDic["pagerows"] = 20
        //设置url
        let url:NSURL = NSURL(string: path)!
        let request = NSMutableURLRequest.init(url: url as URL)
        //修改请求类型为post，默认是get
        request.httpMethod = "POST"
//        let parmStr:NSString = "corgid=111&orgid=75&pageindex=1&subject=0&pagerows=20"
//        request.httpBody = parmStr.data(using: String.Encoding.utf8.rawValue)
        request.httpBody = NSKeyedArchiver.archivedData(withRootObject: parmDic)
        var response:URLResponse?
        do {
            
            let received =  try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
            let dic = try JSONSerialization.jsonObject(with: received, options: JSONSerialization.ReadingOptions.allowFragments)
            print(dic)
        } catch let error{
            print(error.localizedDescription);
        }
    }
    func creatBaseUI() {
        _carTableView = UITableView.init(frame:CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight) , style: UITableViewStyle.plain)
        _carTableView.delegate = self
        _carTableView.dataSource = self
        self.view.addSubview(_carTableView)
        _carTableView.register(UINib.init(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell: CarTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CarTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    //MARK: - 同步Post方式   http://js.yixc.com/jp2ass.api/coach/pagelist  {
//    pageindex = 1;
//    pagesize = 20;
//    schid = 211;
//    teachmode = "-1";

    func synchronousPost() {
        //http://js.yixc.com/rmwebapp/sch/brsch-370/students/1/20
        // 1、创建URL对象；
//        let url:URL! = URL(string:"http://api.3g.ifeng.com/clientShortNews");
        let url:URL! = URL(string:"http://js.yixc.com/jp2ass.api/coach/pagelist");
        // 2、创建Request对象
        // url: 请求路径
        // cachePolicy: 缓存协议
        // timeoutInterval: 网络请求超时时间(单位：秒)
        var urlRequest:URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // 3、设置请求方式为POST，默认是GET
        urlRequest.httpMethod = "POST"
        
        // 4、设置参数
        let str:String = "pageindex=1&pagesize=20&schid=211&teachmode=-1"
        let data:Data = str.data(using: .utf8, allowLossyConversion: true)!
        urlRequest.httpBody = data;
        
        // 5、响应对象
        var response:URLResponse?
        
        // 6、发出请求
        do {
            let received =  try NSURLConnection.sendSynchronousRequest(urlRequest, returning: &response)
            print("fan===== \(String(describing: response))")
            let dic = try JSONSerialization.jsonObject(with: received, options: JSONSerialization.ReadingOptions.mutableLeaves)
            print(dic)
            
            //let jsonStr = String(data: received, encoding:String.Encoding.utf8);
            //print(jsonStr)
            
        } catch let error{
            print(error.localizedDescription);
        }
    }
    func synchronousGet(){
        
        // 1、创建URL对象；
        let url:URL! = URL(string:"http://js.yixc.com/rmwebapp/sch/brsch-370/students/1/20");
        
        // 2、创建Request对象
        // url: 请求路径
        // cachePolicy: 缓存协议
        // timeoutInterval: 网络请求超时时间(单位：秒)
        let urlRequest:URLRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        // 3、响应对象
        var response:URLResponse?
        
        // 4、发出请求
        do {
            
            let received =  try NSURLConnection.sendSynchronousRequest(urlRequest, returning: &response)
            let dic = try JSONSerialization.jsonObject(with: received, options: JSONSerialization.ReadingOptions.allowFragments)
            print(dic)
            
            //let jsonStr = String(data: received, encoding:String.Encoding.utf8);
            //print(jsonStr)
            
        } catch let error{
            print(error.localizedDescription);
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
