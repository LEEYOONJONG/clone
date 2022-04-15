//
//  ViewController.swift
//  AppleTV
//
//  Created by YOONJONG on 2022/04/15.
//

import UIKit

class TabBarController: UITabBarController {
    private lazy var originalViewController:UIViewController = {
        let viewController = UINavigationController(rootViewController: OriginalViewController())
        let tabBarItem = UITabBarItem(title: "Original", image: UIImage(systemName: "tv.fill"), tag: 0)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    private lazy var searchViewController:UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [originalViewController, searchViewController]
    }


}

