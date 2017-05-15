//
//  CarDetailsController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/12.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let detailsCellID = "detailsCellID"

class CarDetailsController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var _tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆详情"
        creatBaseUI()
    }
    func creatBaseUI() {
        _tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight))
        _tableView.delegate = self
        _tableView.dataSource = self
        self.view.addSubview(_tableView)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 110
        }else if indexPath.row == 4 {
            return 80
        }else if indexPath.row == 5 {
            return 235
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = CarDetailsCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: detailsCellID)
        if indexPath.row == 2 || indexPath.row == 3 {
            cell.nameLabel.isHidden = false
            cell.contentLabel.isHidden = false
        }else{
            cell.nameLabel.isHidden = true
            cell.contentLabel.isHidden = true
        }
        if indexPath.row == 0 {
            let firstView:CarDetailsRow_0_View = CarDetailsRow_0_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 110))
            cell.contentView.addSubview(firstView)
        }
        if indexPath.row == 1 {
            let secondary:CarDetailsRow_1_View = CarDetailsRow_1_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 50))
            cell.contentView.addSubview(secondary)
        }
        if indexPath.row == 2 {
            cell.nameLabel.text = "培训科目"
            cell.contentLabel.text = "科目一"
        }
        if indexPath.row == 3 {
            cell.nameLabel.text = "所属分校"
            cell.contentLabel.text = "星唯科技有限公司"
        }
        if indexPath.row == 4 {
            let fourView:CarDetailsRow_4_View = CarDetailsRow_4_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 80))
            cell.contentView.addSubview(fourView)
        }
        if indexPath.row == 5 {
            let firve = CarDetailsRow_5_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 235))
            cell.contentView.addSubview(firve)
        }
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
