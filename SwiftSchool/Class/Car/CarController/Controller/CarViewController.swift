//
//  CarViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit


 let cellID = "ID"
class CarViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    var _carTableView = UITableView()
    var _dataArray = NSMutableArray()
    var _searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆"
        creatBaseUI()
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
        _searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: 64, width: WindowWidth, height: 40))
        _searchBar.delegate = self
        _searchBar.placeholder = "输入车牌号搜索"
        self.view.addSubview(_searchBar)
        
        let topSiftView = TopSiftView()
        topSiftView.frame = CGRect.init(x: 0, y: 104, width: WindowWidth, height: 50)
        self.view.addSubview(topSiftView);
        
        
        _carTableView = UITableView.init(frame:CGRect.init(x: 0, y: 154, width: WindowWidth, height: WindowHeight) , style: UITableViewStyle.plain)
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
        let carDeatils = CarDetailsController()
        self.navigationController?.pushViewController(carDeatils, animated: true)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        _searchBar.resignFirstResponder()
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
