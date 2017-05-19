//
//  MySelfStudentsController.swift
//  SwiftSchool
//
//  Created by 666gps on 2017/5/19.
//  Copyright © 2017年 666gps. All rights reserved.
//

import UIKit
let mySelfStudentsCellID = "mySelfStudentsCellID"

class MySelfStudentsController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    var studentsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的学员"
       creatBaseUI()
    }
    func creatBaseUI(){
        studentsTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: WindowWidth, height: WindowHeight), style: UITableViewStyle.plain)
        studentsTableView.delegate = self
        studentsTableView.dataSource = self
        studentsTableView.rowHeight = 120
        studentsTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(studentsTableView)
        
        studentsTableView.register(UINib.init(nibName: "MySelfStudentsCell", bundle: nil), forCellReuseIdentifier: mySelfStudentsCellID)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MySelfStudentsCell = tableView.dequeueReusableCell(withIdentifier: mySelfStudentsCellID, for: indexPath) as! MySelfStudentsCell
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
