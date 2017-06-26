//
//  CarTableViewCell.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/4/11.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

class CarTableViewCell: UITableViewCell {
    
    static let carTableViewID = "ID"
    
    @IBOutlet weak var onLineImageView: UIImageView!
    @IBOutlet weak var addressImageView: UIImageView!
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
    public var carListModel : CarListModel!{
        willSet{

        }
        didSet{

            if carListModel.deviceid != 0 {
                carNumerLabel.text = carListModel.platno
                timeLabel.text = TimePublic().timeStampSwitchDate(timeStamp: Double(carListModel.gpstime))
                coachNameLabel.text = String(format: "教练:%@", carListModel.traincoachname)
                studentNameLabel.text = String(format: "学员:%@", carListModel.trainstudentname)
                carTypeImageView.image = UIImage.init(named: String(format: "car_status_%@", carListModel.perdrivtype))
                let speed = CGFloat(carListModel.speed / 1000)
                velocityLabel.text = String(format: "%.2fkm/h", speed)
                let photo = carListModel.trainphoto as String
                if photo != "暂无" {
                    let url : URL = URL.init(string: carListModel.trainphoto)!
                    let data : NSData! = NSData(contentsOf: url)
                    if data != nil {
                        headImageView.image = UIImage.init(data: data as Data, scale: 1)
                    }else{
                        headImageView.image = UIImage.init(named: "005")
                    }
                }else{
                    headImageView.image = UIImage.init(named: "005")
                }
                if carListModel.online == 1 {
                    if carListModel.acc == 1 {
                        accTypeImageView.image = UIImage.init(named: "car_status_qidong")
                    }else{
                        accTypeImageView.image = UIImage.init(named: "car_status_xihuo")
                    }
                }else{
                    accTypeImageView.image = UIImage.init(named: "car_status_lixian")
                }
                if carListModel.businesstype == 1 {
                    teacherTypeImageView.image = UIImage.init(named: "car_status_peixun")
                }else{
                    teacherTypeImageView.image = UIImage.init(named: "car_status_kongxian")
                }
            }else{
               carNumerLabel.text = carListModel.platno
                timeLabel.text = "暂无"
                coachNameLabel.text = "暂无"
                studentNameLabel.text = "暂无"
                carTypeImageView.image = UIImage.init(named:  "005")
                headImageView.image = UIImage.init(named: "005")
                accTypeImageView.image = UIImage.init(named: "005")
                teacherTypeImageView.image = UIImage.init(named: "005")
            }
        }
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
