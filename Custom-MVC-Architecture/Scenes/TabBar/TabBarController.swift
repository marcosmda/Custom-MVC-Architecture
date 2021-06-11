//
//  TabBarController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 10/06/21.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setApplicationViewControllers()
    }
    
    func setApplicationViewControllers() {
        
        var tabBarIcons: [UIImage?] = []
        
        // 1º tab
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        tabBarIcons.append(UIImage(systemName: "magnifyingglass"))
        
        setViewControllers([searchViewController], animated: false)
        
        if let tabBarItems = tabBar.items {
            for (i, item) in tabBarItems.enumerated() {
                item.image = tabBarIcons[i]
            }
        }
        
    }

}
