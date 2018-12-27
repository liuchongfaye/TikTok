//
//  VideoViewController.swift
//  TikTok
//
//  Created by 刘冲 on 2018/12/24.
//  Copyright © 2018 lc. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    open var videoIndex : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label : UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 100, width: self.view.bounds.width, height: 40))
        label.backgroundColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
        label.text = "第\(String(describing: self.videoIndex!))条抖音视频"
        self.view .addSubview(label)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
