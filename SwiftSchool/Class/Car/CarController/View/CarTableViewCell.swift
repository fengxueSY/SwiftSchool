//
//  CarTableViewCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    @IBOutlet weak var onLineImageView: UIImageView!
    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var teacherTypeImageView: UIImageView!
    @IBOutlet weak var accTypeImageView: UIImageView!
    @IBOutlet weak var carTypeImageView: UIImageView!
    @IBOutlet weak var coachNameLabel: UILabel!
    @IBOutlet weak var carNumerLabel: UILabel!

    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
