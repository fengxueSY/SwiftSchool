//
//  RecruitPlaceController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/18.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

typealias chooseRecuritPlaceBlack = (_ placeName:RecruitPlaceModel) -> Void

class RecruitPlaceController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var recruitTabelView = UITableView()
    var placeArray = NSMutableArray()
    public var brschListModel : BrschList = BrschList()
    
    //闭包回调选择的地点
    var recuritPlaceName : chooseRecuritPlaceBlack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "招生点"
        placeArray = NSMutableArray.init()
        creatBranchListTableView()
         getRecruitPlaceList()
    }
    func getRecruitPlaceList() {
        var parmDic : NSDictionary?
        if (brschListModel.path as NSString).length != 0 {
            parmDic = ["path": brschListModel.path] as NSDictionary
        }else{
            parmDic = ["path": NSNull()] as NSDictionary
        }
        
        RecruitPlaceModel().getRecruitListParm(parm: parmDic!, succee: { (succee) in
            
            placeArray = succee as! NSMutableArray
            recruitTabelView.reloadData()
            
        }, fail: { (fail) in
            print(fail)
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension RecruitPlaceController {
     fileprivate func creatBranchListTableView(){
        recruitTabelView = UITableView.init()
        recruitTabelView.frame = CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight)
        recruitTabelView.delegate = self
        recruitTabelView.dataSource = self
        recruitTabelView.rowHeight = 44
        recruitTabelView.isUserInteractionEnabled = true
        recruitTabelView.tableFooterView = UIView.init()
        self.view.addSubview(recruitTabelView)
        recruitTabelView.register(UITableViewCell.self, forCellReuseIdentifier: branchListCellID)
    }
    //MARK:- tabelView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: branchListCellID, for: indexPath)
        if cell.isEqual(nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: branchListCellID)
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        let model = placeArray[indexPath.row] as! RecruitPlaceModel
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.textLabel?.text = model.shortname
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = placeArray[indexPath.row] as! RecruitPlaceModel
        recuritPlaceName!(model)
        self.navigationController?.popViewController(animated: true)
    }

}
