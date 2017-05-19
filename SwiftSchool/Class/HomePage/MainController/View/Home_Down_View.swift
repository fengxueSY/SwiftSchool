//
//  Home_Down_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/17.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let home_down_collectionCellID = "home_down_collectionCellID"

//声明一个闭包
typealias allNumberBlock = (_ studentsNumber:NSString) -> Void

class Home_Down_View: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    var collectionView : UICollectionView?
    var dataArray = NSMutableArray()
    var maxNumber = CGFloat()
    
    var allStudentsNumber : allNumberBlock?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        dataArray = NSMutableArray.init()
        for _ in 1 ..< 100 {
            let s:CGFloat = CGFloat(arc4random()%100)
            dataArray.add(s)
        }
        //获取数组中的最大值
        maxNumber = dataArray.value(forKeyPath: "@max.floatValue") as! CGFloat
        creatBaseUI()
        
    }
    func creatBaseUI(){
        let yout = Home_Down_View_FlowLayout.init()
        yout.itemSize = CGSize.init(width: WindowWidth / 7, height: self.frame.size.height)
        yout.scrollDirection = UICollectionViewScrollDirection.horizontal
        yout.minimumLineSpacing = 0
        yout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: yout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        collectionView?.contentInset = UIEdgeInsetsMake(0, WindowWidth / 2, 0, WindowWidth / 2)
        collectionSizeScrollView()
        self.addSubview(collectionView!)
        collectionView?.register(Home_Down_CollectionCell.self, forCellWithReuseIdentifier: home_down_collectionCellID)
    }
    func collectionSizeScrollView(){
        let cellWidt = WindowWidth / 7
        let coun:CGFloat = CGFloat(dataArray.count)
        collectionView?.contentOffset = CGPoint.init(x: cellWidt * coun, y: 0)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:Home_Down_CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: home_down_collectionCellID, for: indexPath) as! Home_Down_CollectionCell
        let num:CGFloat = dataArray[dataArray.count - 1 - indexPath.row] as! CGFloat
//        let num:CGFloat = dataArray[indexPath.row] as! CGFloat
        let cellLabelHeight:CGFloat = self.frame.size.height - 40
        let midLabelHeight:CGFloat = (num / maxNumber) * cellLabelHeight
        let viewH:CGFloat = cell.frame.size.height
        let viewW:CGFloat = cell.frame.size.width
        
        cell.upNumberLabel.frame = CGRect.init(x: 0, y: viewH - midLabelHeight - 40, width: viewW, height: 19)
        cell.midLabel.frame = CGRect.init(x: viewW / 3, y: cell.upNumberLabel.frame.maxY, width: viewW / 3, height: midLabelHeight)
        cell.upNumberLabel.text = "\(dataArray[dataArray.count - 1 - indexPath.row])"
        cell.downDateLabel.text = "\(dataArray.count - 1 - indexPath.row)"
        return cell
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        getMaxStudentNumber()
    }
    func getMaxStudentNumber(){
        let visiCell = collectionView?.visibleCells
        for cell_C in visiCell! {
            if cell_C.alpha > 0.9 {
                let cell:Home_Down_CollectionCell = cell_C as! Home_Down_CollectionCell
                allStudentsNumber!(cell.upNumberLabel.text! as NSString)
            }
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset_x:CGFloat = (collectionView?.contentOffset.x)!
        let wind_x:CGFloat = WindowWidth * 2
//        print("\(offset_x) ---- \(wind_x)")
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
