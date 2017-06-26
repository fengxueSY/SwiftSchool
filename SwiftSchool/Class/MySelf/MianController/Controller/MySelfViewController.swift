//
//  MySelfViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

let MySelfCellID = "MySelfCellID"

class MySelfViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    var titleArrayOne = ["我的驾校","我的学员","我的车辆","我的教练","我的订单"]
    var headImageOne = ["学院学校","My-student","My-car","My-coach","My-order"]
    
    var titleArrayTwo = ["关于我们","当前版本","清楚缓存"]
    var headImageTwo = ["About-us","update","cache"]
    
    var outLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的"
        creatBaseUI()
        let useI = UserInformationSing.userInfo
        print("----------------- \(useI.tokenId)")
    }
    func creatBaseUI(){
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        self.view.addSubview(tableView)
         tableView.register(UINib.init(nibName: "MySelfCell", bundle: nil), forCellReuseIdentifier: MySelfCellID)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            if indexPath.row == 3 {
                return 80
            }else{
                return 50
            }
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        }else{
            return 4
        }
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
        let cell:MySelfCell = tableView.dequeueReusableCell(withIdentifier: MySelfCellID, for: indexPath) as! MySelfCell
        
        if indexPath.section == 0 {
            cell.headImageView.image = UIImage.init(named: headImageOne[indexPath.row])
            cell.nameLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.nameLabel?.text = "\(titleArrayOne[indexPath.row])"
        }else{
            if indexPath.row != 3 {
                cell.headImageView?.image = UIImage.init(named: headImageTwo[indexPath.row])
                cell.nameLabel?.font = UIFont.systemFont(ofSize: 14)
                cell.nameLabel?.text = "\(titleArrayTwo[indexPath.row])"
            }else{
                cell.headImageView.isHidden = true
                cell.nameLabel.isHidden = true
                if outLoginButton.isEqual(nil) {
                    outLoginButton.removeFromSuperview()
                }
                outLoginButton = UIButton.init(type: UIButtonType.custom)
                outLoginButton.frame = CGRect.init(x: 25, y: 15, width: WindowWidth - 50, height: 50)
                outLoginButton.backgroundColor = greenBackColor
                outLoginButton.setTitle("退出", for: UIControlState.normal)
                outLoginButton.layer.cornerRadius = 5
                outLoginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
                cell.contentView.addSubview(outLoginButton)
            }
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 1 {
                self.navigationController?.pushViewController(MySelfStudentsController(), animated: true)
            }
        }
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
