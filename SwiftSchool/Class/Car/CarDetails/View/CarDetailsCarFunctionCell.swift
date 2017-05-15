//
//  CarDetailsCarFunctionCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/15.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarDetailsCarFunctionCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.textAlignment = NSTextAlignment.center
    }

}
