//
//  CarDetailsRow_5_View.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/15.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let CarDetailsCarFunctionCellID = "CarDetailsCarFunctionCellID"

class CarDetailsRow_5_View: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    var nameLabel = UILabel()
    var backView = UIView()
    var collectionView : UICollectionView?
    
    var titleArray = ["实时位置","教学轨迹","实时视频","教学分析","行车影像"]
    var titleImage = ["car_function_place","car_function_track","car_function_livevideo","car_function_teach","car_function_video"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let viewW = self.frame.width
 
        nameLabel = UILabel.init(frame: CGRect.init(x: viewW / 32, y: 5, width: 80, height: 25))
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.text = "车辆功能"
        self.addSubview(nameLabel)
        
        backView = UIView.init(frame: CGRect.init(x: viewW / 32, y: nameLabel.frame.maxY + 5, width: viewW * 30 / 32, height: 190))
        backView.layer.borderWidth = 0.8
        backView.layer.borderColor = UIColor.gray.cgColor
        self.addSubview(backView)
        
        let yout = UICollectionViewFlowLayout.init()
        yout.scrollDirection = UICollectionViewScrollDirection.vertical
        yout.itemSize = CGSize.init(width: 70, height: 80)
        yout.minimumLineSpacing = 5
        yout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: backView.frame.width, height: backView.frame.height), collectionViewLayout: yout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor.white
        backView.addSubview(collectionView!)
        
        collectionView?.register(UINib.init(nibName: "CarDetailsCarFunctionCell", bundle: nil), forCellWithReuseIdentifier: CarDetailsCarFunctionCellID)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CarDetailsCarFunctionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CarDetailsCarFunctionCellID, for: indexPath) as! CarDetailsCarFunctionCell
        cell.headImageView.image = UIImage.init(named: titleImage[indexPath.row])
        cell.nameLabel.text = titleArray[indexPath.row]
        return cell
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
