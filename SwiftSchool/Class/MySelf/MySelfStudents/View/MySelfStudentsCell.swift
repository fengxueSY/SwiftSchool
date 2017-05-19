//
//  MySelfStudentsCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/19.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class MySelfStudentsCell: UITableViewCell {
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var coachLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
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
