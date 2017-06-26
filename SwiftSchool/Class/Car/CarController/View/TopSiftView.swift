 //
//  TopSiftView.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/12.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
 let topSoftTableViewCellID = "ID"
 typealias isShowBlock = (_ number : NSInteger) -> Void
 protocol TopSiftViewDelegate {
    func rutuenSelectSift(dicNumber:NSInteger ,tabNumber:NSInteger)
 }
class TopSiftView: UIView,UITableViewDelegate,UITableViewDataSource {
    var conditionTableView = UITableView()
    var dataArray = NSArray()
    var selectNumber = NSInteger()
    var listArray = NSArray()
    var isShowTableViewBlock : isShowBlock?
    var isTableViewHide = Bool()
    var selectCellNumber = NSInteger()
    var delegate : TopSiftViewDelegate?
    var selectTitle = String()
    
    
    init(frame: CGRect,parm: NSArray) {
        super.init(frame:frame)
        selectNumber = -1
        dataArray = parm
       handleDicData(array: parm)
    }
    func handleDicData(array : NSArray){
        let num = CGFloat(array.count)
        let buttonW = WindowWidth / num
        for i in 0 ..< array.count {
            let dic = array[i] as! NSDictionary
            let button = RightImageLeftTitleButton.init(type: .custom)
            button.setTitle(dic.object(forKey: "title") as? String, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.borderWidth = 0.5
            button.tag = 1800 + i
            button.frame = CGRect.init(x: buttonW * CGFloat(i), y: 0, width: buttonW, height: 40)
            button.setImage(UIImage.init(named: "map_icon_down"), for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.addTarget(self, action: #selector(showTableView(sender:)), for: .touchUpInside)
            self.addSubview(button)
        }
        creatTableView()
    }
    func showTableView(sender:UIButton){
        if selectNumber == sender.tag - 1800 {
            hideTabelView()
        }else{
            if !isTableViewHide {
                hideTabelView()
                selectNumber = sender.tag - 1800
                listArray = ((dataArray[selectNumber] as! NSDictionary).object(forKey: "ListTitle") as! NSArray)
                selectTitle = (dataArray[selectNumber] as! NSDictionary).object(forKey: "title") as! String
                showTableView()
            }else{
                selectNumber = sender.tag - 1800
                listArray = ((dataArray[selectNumber] as! NSDictionary).object(forKey: "ListTitle") as! NSArray)
                selectTitle = (dataArray[selectNumber] as! NSDictionary).object(forKey: "title") as! String
                showTableView()
            }
            isShowTableViewBlock!(sender.tag)
            
        }
    }
    func showTableView(){
        isTableViewHide = false
        let but = self.viewWithTag(selectNumber + 1800) as! RightImageLeftTitleButton
        but.setTitleColor(RGBColor().rgbColor(red: 34, green: 172, blue: 56, alpha: 1), for: .normal)
        but.setImage(UIImage.init(named: "map_icon_down_pre"), for: .normal)
        
        conditionTableView.reloadData()
        if listArray.count > 5 {
            conditionTableView.frame = CGRect.init(x: 0, y: 40, width: self.frame.size.width, height: 200)
        }else{
            conditionTableView.frame = CGRect.init(x: 0, y: 40, width: self.frame.size.width, height: 40 * CGFloat(listArray.count))
        }
    }
    func hideTabelView(){
        isTableViewHide = true
        if selectNumber != -1 {
            let but = self.viewWithTag(selectNumber + 1800) as! RightImageLeftTitleButton
            but.setTitleColor(UIColor.gray, for: .normal)
            but.setImage(UIImage.init(named: "map_icon_down"), for: .normal)
        }
        conditionTableView.frame = CGRect.init(x: 0, y: 40, width: self.frame.size.width, height: 0)
        selectNumber = -1
    }
    func creatTableView(){
        conditionTableView = UITableView.init(frame: CGRect.init(x: 0, y: 40, width: self.frame.size.width, height: 0), style: .plain)
        conditionTableView.delegate = self
        conditionTableView.dataSource = self
        conditionTableView.tableFooterView = UIView.init()
        self.addSubview(conditionTableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: topSoftTableViewCellID)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: topSoftTableViewCellID)
        }
        if indexPath.row == selectCellNumber {
            cell?.accessoryType = .checkmark
        }else{
            cell?.accessoryType = .none
        }
        cell?.textLabel?.text = listArray[indexPath.row] as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectCellNumber = indexPath.row
        let btn : RightImageLeftTitleButton = self.viewWithTag(1800 + selectNumber) as! RightImageLeftTitleButton
        if indexPath.row != 0 {
            var title = listArray[indexPath.row] as! NSString
            if title.length > 3 {
                let tiStr = title.substring(to: 3)
                title = String(format: "%@...", tiStr) as NSString
            }
            btn.setTitle(title as String, for: .normal)
        }else{
            btn.setTitle(selectTitle, for: .normal)
        }
        conditionTableView.reloadData()
       
        if (delegate != nil) {
            isShowTableViewBlock!(-1)
            delegate?.rutuenSelectSift(dicNumber: selectNumber, tabNumber: indexPath.row)
        }
         hideTabelView()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("");
    }
}
