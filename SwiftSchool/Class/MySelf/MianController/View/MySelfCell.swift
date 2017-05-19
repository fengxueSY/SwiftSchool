//
//  MySelfCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/18.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class MySelfCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
