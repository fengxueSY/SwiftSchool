//
//  Home_Mid_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/17.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let branchListCellID = "branchListCellID"

class Home_Mid_View: UIView {
    var upView = UIView()
    var branchButton = UIButton()
    var branchLabel = UILabel()
    var recruitButton = UIButton()
    var recruitLabel = UILabel()
    
    
    var downView = UIView()
    var titleRecruitLabel = UILabel()
    var nmberLabel = UILabel()
    var rightNumberLable = UILabel()
    
    let viewW:CGFloat = WindowWidth
    let viewH:CGFloat = (WindowHeight - 200) / 3
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatBaseUI_Up()
        creatBaseUI_Down()
        
    }
    func creatBaseUI_Up(){
        let upViewH:CGFloat = viewH / 2
        let upViewW:CGFloat = viewW
        upView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: viewW, height: viewH / 2))
        self.addSubview(upView)
        
        branchButton = RightImageLeftTitleButton()
        branchButton.frame = CGRect.init(x: 0, y: upViewH / 6, width: upViewW / 2, height: upViewH * 2 / 6)
        branchButton.setTitle("分校", for: UIControlState.normal)
        branchButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        branchButton.setImage(UIImage.init(named: "common_select_right"), for: UIControlState.normal)
        upView.addSubview(branchButton)
        
        branchLabel = UILabel.init(frame: CGRect.init(x: 0, y: branchButton.frame.maxY, width: upViewW / 2, height: upViewH * 2 / 6))
        branchLabel.textAlignment = NSTextAlignment.center
        branchLabel.font = UIFont.systemFont(ofSize: 12)
        branchLabel.text = "广州天河区分校"
        upView.addSubview(branchLabel)
        
        let lineLabel:UILabel = UILabel.init(frame: CGRect.init(x: upViewW / 2 - 1, y: upViewH / 8, width: 1, height: upViewH * 6 / 8))
        lineLabel.backgroundColor = grayLineBackColor
        upView.addSubview(lineLabel)
        
        recruitButton = RightImageLeftTitleButton()
        recruitButton.frame = CGRect.init(x: lineLabel.frame.maxX, y: upViewH / 6, width: upViewW / 2, height: upViewH * 2 / 6)
        recruitButton.setTitle("招生点", for: UIControlState.normal)
        recruitButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        recruitButton.setImage(UIImage.init(named: "common_select_right"), for: UIControlState.normal)
        upView.addSubview(recruitButton)
        
        recruitLabel = UILabel.init(frame: CGRect.init(x: lineLabel.frame.maxX, y: recruitButton.frame.maxY, width: upViewW / 2, height: upViewH * 2 / 6))
        recruitLabel.textAlignment = NSTextAlignment.center
        recruitLabel.font = UIFont.systemFont(ofSize: 12)
        recruitLabel.text = "广州天河区分校"
        upView.addSubview(recruitLabel)
    }
    func creatBaseUI_Down(){
        let downViewH:CGFloat = viewH / 2
        let downViewW:CGFloat = viewW
        downView = UIView.init(frame: CGRect.init(x: 0, y: upView.frame.maxY, width: downViewW, height: downViewH))
        self.addSubview(downView)

        titleRecruitLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: downViewW, height: downViewH * 2 / 8))
        titleRecruitLabel.textAlignment = NSTextAlignment.center
        titleRecruitLabel.text = "当日招生人数"
        titleRecruitLabel.backgroundColor = UIColor.clear
        titleRecruitLabel.textColor = RGBColor().rgbColor(red: 60, green: 179, blue: 113, alpha: 1)
        titleRecruitLabel.font = UIFont.systemFont(ofSize: 15)
        downView.addSubview(titleRecruitLabel)
        
        nmberLabel = UILabel.init(frame: CGRect.init(x: downViewW / 4, y: titleRecruitLabel.frame.maxY + 5, width: downViewW / 2, height: downViewH * 5 / 8))
        nmberLabel.textColor = RGBColor().rgbColor(red: 60, green: 179, blue: 113, alpha: 1)
        nmberLabel.textAlignment = NSTextAlignment.center
        nmberLabel.font = UIFont.systemFont(ofSize: 15)
        downView.addSubview(nmberLabel)
        
        rightNumberLable = UILabel.init()
        let rightStr:NSString = "当月招生30人"
        rightNumberLable.textColor = UIColor.white
        rightNumberLable.textAlignment = NSTextAlignment.center
        rightNumberLable.backgroundColor = UIColor.clear
        let attRightStr = NSMutableAttributedString(string: rightStr as String)
        attRightStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 15), range: NSRange.init(location: 0, length: 4))
        attRightStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 22), range: NSRange.init(location: 4, length: rightStr.length - 4))
        let width_L:CGFloat = StringPublic().stringWidth(str: rightStr, font: 20, height: downViewH / 2)
        rightNumberLable.frame = CGRect.init(x: downViewW - width_L, y: titleRecruitLabel.frame.maxY + 2, width: width_L, height: downViewH * 4 / 8)
        rightNumberLable.layer.masksToBounds = true
        rightNumberLable.layer.cornerRadius = downViewH / 4
        rightNumberLable.attributedText = attRightStr
        let imageView = UIImageView.init(frame: CGRect.init(x: downViewW - width_L, y: titleRecruitLabel.frame.maxY + 2, width: width_L, height: downViewH * 4 / 8))
        imageView.image = UIImage.init(named: "month_home")
        downView.addSubview(imageView)
        downView.addSubview(rightNumberLable)
        
    }
        required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
