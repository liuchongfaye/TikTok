//
//  ViewController.swift
//  TikTok
//
//  Created by 刘冲 on 2018/12/24.
//  Copyright © 2018 lc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var viewControllers : Array<UIViewController> = []
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index : Int = self.viewControllers.index(of: viewController) ?? NSNotFound
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return self.viewControllers[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index : Int = self.viewControllers.index(of: viewController) ?? NSNotFound
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        if index >= self.viewControllers.count {
            return nil
        }
        
        return self.viewControllers[index]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建搜索页，视频列表页和用户详情页
        let searchVC : SearchViewController = SearchViewController()
        let videosVC : VideosViewController = VideosViewController()
        let userInfoVC : UserInfoViewController = UserInfoViewController()
        self.viewControllers = [searchVC, videosVC, userInfoVC]
        
        // 创建UIPageViewController
        let pageVC : UIPageViewController = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        pageVC.setViewControllers([videosVC], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        
        // 将pageVC添加到当前VC
        self.addChild(pageVC)
        self.view.addSubview(pageVC.view)
        pageVC.view.frame = self.view.bounds
        pageVC.didMove(toParent: self)
    }


}

