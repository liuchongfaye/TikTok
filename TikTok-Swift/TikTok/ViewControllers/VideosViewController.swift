//
//  VideosViewController.swift
//  TikTok
//
//  Created by 刘冲 on 2018/12/24.
//  Copyright © 2018 lc. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController,UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    var currentIndex : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        
        // 当前类的功能描述
        let desLabel : UILabel = UILabel(frame: self.view.bounds)
        desLabel.numberOfLines = 0
        desLabel.textColor = UIColor.white
        desLabel.textAlignment = NSTextAlignment.center
        desLabel.text = "抖音视频列表页\n往右滑到搜索页，往左滑到用户详情页\n上下滑切换视频"
        self.view.addSubview(desLabel)
        
        // 创建 UIPageViewController
        let pageVC : UIPageViewController = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.vertical, options: nil)
        let videoVC : VideoViewController = VideoViewController()
        videoVC.videoIndex = self.currentIndex
        pageVC.setViewControllers([videoVC], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        
        // 将pageVC添加到当前VC
        self.addChild(pageVC)
        self.view.addSubview(pageVC.view)
        pageVC.view.frame = self.view.bounds
        pageVC.didMove(toParent: self)
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if self.currentIndex == 1 {
            return nil;
        }
        
        let videoVC : VideoViewController = VideoViewController()
        videoVC.videoIndex = self.currentIndex - 1
        videoVC.view.backgroundColor = UIColor.white
        return videoVC;
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let videoVC : VideoViewController = VideoViewController()
        videoVC.videoIndex = self.currentIndex + 1
        videoVC.view.backgroundColor = UIColor.white
        return videoVC;
    }

    // MARK: - UIPageViewControllerDelegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let videoController : VideoViewController = pageViewController.viewControllers?[0] as! VideoViewController
        self.currentIndex = videoController.videoIndex!
        UIView.animate(withDuration: 2.0) {
            videoController.view.backgroundColor = UIColor.clear
        }
    }
    
}
