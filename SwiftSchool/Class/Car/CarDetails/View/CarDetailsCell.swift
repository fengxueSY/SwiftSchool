//
//  CarDetailsCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/15.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarDetailsCell: UITableViewCell {
    var nameLabel = UILabel()
    var contentLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let cellW = WindowWidth
        let cellH = self.frame.size.height
        
        nameLabel = UILabel.init(frame: CGRect.init(x: cellW / 32, y: 0, width: cellW * 6 / 32, height: cellH))
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = UIColor.black
        self.contentView.addSubview(nameLabel)
        
        contentLabel = UILabel.init(frame: CGRect.init(x: nameLabel.frame.maxX + 5, y: 0, width: cellW * 16 / 32, height: cellH))
        contentLabel.textColor = UIColor.black
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        self.contentView.addSubview(contentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
