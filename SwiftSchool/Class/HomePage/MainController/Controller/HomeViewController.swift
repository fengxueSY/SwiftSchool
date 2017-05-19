//
//  HomeViewController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var branchListArray = NSMutableArray()
    var branchListTableView = UITableView()
    var upView = Home_Up_View()
    var midView = Home_Mid_View()
    var downView = Home_Down_View()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主页"
        creatBaseUI()
        
        branchListArray = NSMutableArray.init()
        let branchArray:NSArray = ["广州","上海","北京","重庆","郑州"]
        for i in 0 ..< 50 {
            let inde:Int = Int(arc4random()%5)
            branchListArray.add(NSString(format: "%@__%ld", branchArray[inde] as! CVarArg,i))
        }
        creatBranchListTableView()
    }
    func creatBaseUI(){
        upView = Home_Up_View.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: 200))
        
        midView = Home_Mid_View.init(frame: CGRect.init(x: 0, y: 200, width: WindowWidth, height: (WindowHeight - 200) / 3))
        midView.branchButton.addTarget(self, action: #selector(branchButtonAction), for: UIControlEvents.touchUpInside)
        midView.recruitButton.addTarget(self, action: #selector(recruitAction), for: UIControlEvents.touchUpInside)
        
        downView = Home_Down_View.init(frame: CGRect.init(x: 0, y: midView.frame.maxY, width: WindowWidth, height: (WindowHeight - 200) * 2 / 3 - 44))
        downView.allStudentsNumber = {(studentNumber:NSString) -> Void in
            //获取闭包回调的数据以后，要修改成字符串的格式
            let numberStr:NSString = NSString(format: "%@人", studentNumber)
            let attStr = NSMutableAttributedString(string: numberStr as String)
            attStr.addAttribute(NSFontAttributeName, value: UIFont.italicSystemFont(ofSize: 30), range: NSRange.init(location: 0, length: numberStr.length - 1))
            self.midView.nmberLabel.attributedText = attStr
        }
        
        self.view.addSubview(upView)
        self.view.addSubview(downView)
        self.view.addSubview(midView)
    }
    
    func creatBranchListTableView(){
        branchListTableView = UITableView.init()
        branchListTableView.frame = CGRect.init(x: 0, y: self.midView.frame.maxY - midView.frame.size.height * 7 / 12, width: WindowWidth, height: 0)
        branchListTableView.delegate = self
        branchListTableView.dataSource = self
        branchListTableView.rowHeight = 44
        branchListTableView.isUserInteractionEnabled = true
        branchListTableView.tableFooterView = UIView.init()
        self.view.addSubview(branchListTableView)
        branchListTableView.register(UITableViewCell.self, forCellReuseIdentifier: branchListCellID)
    }
    //MARK:- tabelView delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return branchListArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: branchListCellID, for: indexPath)
        if cell.isEqual(nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: branchListCellID)
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.textLabel?.text = branchListArray[indexPath.row] as? String
        return cell
    }
    //MARK:- 显示分校列表
    func branchButtonAction(){
        if branchListTableView.frame.size.height > 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.branchListTableView.frame = CGRect.init(x: 0, y: self.midView.frame.maxY - self.midView.frame.size.height * 7 / 12, width: WindowWidth, height: 0)
            })
        }else{
            UIView.animate(withDuration: 0.2, animations: {
                if self.branchListArray.count > 5 {
                    self.branchListTableView.frame = CGRect.init(x: 0, y: self.midView.frame.maxY - self.midView.frame.size.height * 7 / 12, width: WindowWidth, height: 220)
                }else{
                    self.branchListTableView.frame = CGRect.init(x: 0, y: self.midView.frame.maxY - self.midView.frame.size.height * 7 / 12, width: WindowWidth, height: CGFloat(44 * self.branchListArray.count))
                }
            })
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        midView.branchLabel.text = branchListArray[indexPath.row] as? String
        branchButtonAction()
    }
    //MARK:- 选择招生点
    func recruitAction(){
        let recruit = RecruitPlaceController()
        recruit.recuritPlaceName = {
            (placeName:String) -> Void in
            self.midView.recruitLabel.text = placeName 
        }
        self.navigationController?.pushViewController(recruit, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
