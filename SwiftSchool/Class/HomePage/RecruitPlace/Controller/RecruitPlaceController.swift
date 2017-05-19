//
//  RecruitPlaceController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/18.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

typealias chooseRecuritPlaceBlack = (_ placeName:String) -> Void

class RecruitPlaceController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var recruitTabelView = UITableView()
    var placeArray = NSMutableArray()
    //闭包回调选择的地点
    var recuritPlaceName : chooseRecuritPlaceBlack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "招生点"
        placeArray = NSMutableArray.init()
        let branchArray:NSArray = ["中国","美国","英国","法国","德国"]
        for i in 0 ..< 50 {
            let inde:Int = Int(arc4random()%5)
            placeArray.add(NSString(format: "%@__%ld", branchArray[inde] as! CVarArg,i))
        }
        creatBranchListTableView()
    }
    func creatBranchListTableView(){
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
        cell.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell.textLabel?.text = placeArray[indexPath.row] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        recuritPlaceName!(placeArray[indexPath.row] as! String)
        self.navigationController?.popViewController(animated: true)
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
