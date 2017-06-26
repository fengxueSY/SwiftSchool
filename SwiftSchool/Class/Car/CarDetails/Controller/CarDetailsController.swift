//
//  CarDetailsController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/12.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let detailsCellID = "detailsCellID"

class CarDetailsController: BaseViewController,UITableViewDelegate,UITableViewDataSource,CarDetailsRow_5_ViewDelegate {

    var _tableView = UITableView()
    var carModel = CarListModel()
    var carDetailsModel = CarDetailsModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "车辆详情"
        creatBaseUI()
        getDataHttps()
    }
    func getDataHttps(){
        CarDetailsModel().getCarDetails(parm: ["vehicleid" : carModel.vehicleid], Succeed: { (succeed) in
            carDetailsModel = succeed as! CarDetailsModel
            _tableView.reloadData()
        }) { (failed) in
            TTAlertVIew.TTAlert(text: failed as! String)
        }
    }
    func creatBaseUI() {
        _tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight))
        _tableView.delegate = self
        _tableView.dataSource = self
        _tableView.tableFooterView = UIView.init()
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
        return 6
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
            firstView.carDetailsModel = carDetailsModel;
            cell.contentView.addSubview(firstView)
        }
        if indexPath.row == 1 {
            let secondary:CarDetailsRow_1_View = CarDetailsRow_1_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 50))
            secondary.carDetailsModel = carDetailsModel
            cell.contentView.addSubview(secondary)
        }
        if indexPath.row == 2 {
            cell.nameLabel.text = "培训科目"
            if carDetailsModel.phase == 1 {
                cell.contentLabel.text = "科目一"
            }else if carDetailsModel.phase == 2 {
                cell.contentLabel.text = "科目二"
            }else if carDetailsModel.phase == 3 {
                cell.contentLabel.text = "科目三"
            }else if carDetailsModel.phase == 4 {
                cell.contentLabel.text = "科目四"
            }
            
        }
        if indexPath.row == 3 {
            cell.nameLabel.text = "所属分校"
            cell.contentLabel.text = carDetailsModel.orgshortname
        }
        if indexPath.row == 4 {
            let fourView:CarDetailsRow_4_View = CarDetailsRow_4_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 80))
            fourView.carDetailsModel = carDetailsModel
            cell.contentView.addSubview(fourView)
        }
        if indexPath.row == 5 {
            let firve = CarDetailsRow_5_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 235))
            firve.delegate = self
            cell.contentView.addSubview(firve)
        }
        return cell
    }
    //MARK: - 赋值数据
    func addDataForView(){
        
    }
    //MARK: - 选择的代理
    func carActionChoose(number: NSInteger) {
        if number == 0 {
            //实时位置
            self.navigationController?.pushViewController(RealTimeAdressController(), animated: true)
        }
        if number == 1 {
            //教学轨迹
            self.navigationController?.pushViewController(CarTrajecoryController(), animated: true)
        }
        if number == 2 {
            //实时视频
            self.navigationController?.pushViewController(RealTimeVideoController(), animated: true)
        }
        if number == 3 {
            //教学分析
            self.tabBarController?.selectedIndex = 2;
        }
        if number == 4 {
            //行车影像
            self.navigationController?.pushViewController(CarVideoController(), animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
