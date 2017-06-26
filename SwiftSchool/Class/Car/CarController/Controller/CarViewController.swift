//
//  CarViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit


let cellID = "ID"
class CarViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,TopSiftViewDelegate {
    var _carTableView = UITableView()
    var _dataArray = NSMutableArray()
    var _searchBar = UISearchBar()
    var brachID = NSInteger()
    var asset = NSInteger()
    var bussiness = NSInteger()
    var carNumber = String()
    var parmDic = NSMutableDictionary()
    var pageNumber = NSInteger()
    var allPageNumber = NSInteger()
    var upView = UIView()
    
    var refreshAction = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆"
        pageNumber = 1;
        parmDic = NSMutableDictionary.init()
        _dataArray = NSMutableArray.init()
        creatBaseUI()
        getDataHttps()
    }
    //MARK -  https
    func getDataHttps(){
        parmDic.setValue(pageNumber, forKey: "pageindex")
        parmDic.setValue(20, forKey: "pagesize")
        CarListModel().getCarsList(parm: parmDic, Success: { succeed , totalPages in
            refreshAction.endRefreshing()
            allPageNumber = totalPages
            if pageNumber == 1 {
                _dataArray.removeAllObjects()
            }
            let sArray = succeed as! NSArray
            for i in 0 ..< sArray.count {
                let model = sArray[i] as! CarListModel
                _dataArray.add(model)
            }
            if sArray.count > 0{
                upView.removeFromSuperview()
            }
            _carTableView.reloadData()
        }, Fail: { failed in
            
        })
    }
    func creatBaseUI() {
        
        upView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 40))
        upView.backgroundColor = UIColor.white
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 40))
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "点击加载更多"
        label.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(refreshUp))
        label.addGestureRecognizer(tap)
        upView.addSubview(label)
        
        _searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: 64, width: WindowWidth, height: 40))
        _searchBar.delegate = self
        _searchBar.placeholder = "输入车牌号搜索"
        self.view.addSubview(_searchBar)
        
        _carTableView = UITableView.init(frame:CGRect.init(x: 0, y: 154, width: WindowWidth, height: WindowHeight - 177) , style: UITableViewStyle.plain)
        _carTableView.delegate = self
        _carTableView.dataSource = self
        _carTableView.separatorStyle = .none
        _carTableView.tableFooterView?.addSubview(upView)
        self.view.addSubview(_carTableView)
        _carTableView.register(UINib.init(nibName: "CarTableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
        
        refreshAction = UIRefreshControl.init()
        refreshAction.addTarget(self, action: #selector(refreshDown), for: .valueChanged)
        refreshAction.attributedTitle = NSAttributedString.init(string: "正在下拉刷新")
        _carTableView.addSubview(refreshAction)
        creatTopSiftView()
    }
    func creatTopSiftView(){
        let branchArray = NSMutableArray.init()
        for model in UserInformationSing.userInfo.branchList {
            branchArray.add((model as! BrschList).shortname)
        }
        let businessArray = ["全部","培训中","未培训"] as NSArray
        let assetArray = ["全部","自营","加盟"] as NSArray
        
        let parmArray = [["title" : "分校","ListTitle":branchArray],["title" : "业务状态","ListTitle":businessArray],["title" : "资产类型","ListTitle":assetArray]] as NSArray
        
        let topSiftView = TopSiftView.init(frame: CGRect.init(x: 0, y: 104, width: WindowWidth, height: 40), parm: parmArray)
        topSiftView.delegate = self
        self.view.addSubview(topSiftView);
        topSiftView.isShowTableViewBlock = { number in
            if number == -1 {
                topSiftView.frame = CGRect.init(x: 0, y: 104, width: WindowWidth, height: 40)
            }else{
                topSiftView.frame = CGRect.init(x: 0, y: 104, width: WindowWidth, height: WindowHeight)
            }
        }

    }
    //MARK- 下拉刷新
    func refreshDown(){
        pageNumber = 1
        getDataHttps()
    }
    //MARK- 上拉加载
    func refreshUp(){
        _carTableView.tableFooterView = nil
        if allPageNumber >= pageNumber {
            pageNumber += 1
            getDataHttps()
        }else{
            let alert = UIAlertView.init(title: "提示", message: "数据已加载完毕", delegate: nil, cancelButtonTitle: "确定")
            alert.show()
        }
    }
    //MARK- top delegate
    func rutuenSelectSift(dicNumber: NSInteger, tabNumber: NSInteger) {
        if dicNumber == 0 {
            if tabNumber == 0 {
                parmDic.removeObject(forKey: "path")
            }else{
                let model = UserInformationSing.userInfo.branchList[tabNumber - 1] as! BrschList
                parmDic.setValue(model.path, forKey: "path")
            }
            pageNumber = 1
            getDataHttps()
        }
        if dicNumber == 1 {
            if tabNumber == 0 {
                parmDic.removeObject(forKey: "businesstype")
            }else{
                parmDic.setValue(tabNumber, forKey: "businesstype")
            }
            pageNumber = 1
            getDataHttps()
        }
        if dicNumber == 2 {
            if tabNumber == 0 {
                parmDic.removeObject(forKey: "assettype")
            }else{
                parmDic.setValue(tabNumber, forKey: "assettype")
            }
            pageNumber = 1
            getDataHttps()
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == _dataArray.count - 1 {
            _carTableView.tableFooterView = upView;
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == _dataArray.count {
            return 40
        }
        return 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CarTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CarTableViewCell
        cell.selectionStyle = .none
        let model = _dataArray[indexPath.row] as! CarListModel
        cell.carListModel = model;
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let carDeatils = CarDetailsController()
        let model = _dataArray[indexPath.row] as! CarListModel
        if model.deviceid != 0 {
            carDeatils.carModel = model
            self.navigationController?.pushViewController(carDeatils, animated: true)
        }else{
          TTAlertVIew.TTAlert(text: "该车辆暂未绑定")
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        _searchBar.resignFirstResponder()
    }
    //MARK- search  delegate
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        _searchBar.showsCancelButton = true
        let btn = searchBar.value(forKey: "_cancelButton") as! UIButton
        btn.setTitle("取消", for: .normal)
        return true
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        _searchBar.showsCancelButton = false
        return true
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        _searchBar.showsCancelButton = false
        parmDic.removeObjects(forKeys: ["businesstype","assettype","path","platno"])
        pageNumber = 1
        getDataHttps()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pageNumber = 1
        parmDic.setValue(searchBar.text, forKey: "platno")
        parmDic.removeObjects(forKeys: ["businesstype","assettype","path"])
        getDataHttps()
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
