//
//  UserInfoViewController.swift
//  TikTok
//
//  Created by 刘冲 on 2018/12/24.
//  Copyright © 2018 lc. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.red
        
        let label : UILabel = UILabel(frame: self.view.bounds)
        label.numberOfLines = 0
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.text = "抖音用户详情页,往右滑到视频列表页面"
        self.view.addSubview(label)
    }
}
