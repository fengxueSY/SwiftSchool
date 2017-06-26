//
//  ListViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let ListCellID = "ListCellID"

class ListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    var titleArray = ["招生统计收费","教练带教统计","教练车教学统计","学员积压统计","学员考试统计","教练预约培训统计","学员预约培训统计"]
    var headImage = ["charge","Coaching","Coach-teaching","Waiting","Examination","Coach-appointment","Student-appointment"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "报表"
        creatBaseUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// 统计报表扩展类
extension ListViewController{
    
    fileprivate func creatBaseUI(){
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 44
        tableView.tableFooterView = UIView.init()
        self.view.addSubview(tableView)
        tableView.register(UINib.init(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: ListCellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView.init()
        headView.backgroundColor = RGBColor().rgbColor(red: 204, green: 204, blue: 204, alpha: 1)
        return headView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ListCell = tableView.dequeueReusableCell(withIdentifier: ListCellID, for: indexPath) as! ListCell
        cell.selectionStyle = .none
        cell.headImageView?.image = UIImage.init(named: headImage[indexPath.row])
        cell.nameLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.nameLabel?.text = "\(titleArray[indexPath.row])"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = ListController()
        list.pStyle = PushStyle(rawValue: 2)
        self.navigationController?.pushViewController(list, animated: true)
    }
}



