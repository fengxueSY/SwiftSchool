//
//  ListUpView.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/6/14.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit

protocol ListUpViewDelegate {
    func showSiftView()
}

class ListUpView: UIView,UISearchBarDelegate {
    @IBOutlet weak var upSiftSearchBar: UISearchBar!

    @IBOutlet weak var upSiftButton: UIButton!
   
    var delegate : ListUpViewDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        upSiftSearchBar.delegate = self
        upSiftButton.addTarget(self, action: #selector(upSiftButtonAction), for: .touchUpInside)
    }
    func upSiftButtonAction(){
        if delegate != nil {
            delegate?.showSiftView()
        }
    }
}
