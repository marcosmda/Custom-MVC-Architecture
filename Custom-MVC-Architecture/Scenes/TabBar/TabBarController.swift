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
        
        // 2º tab
        let aboutViewController = AboutViewController()
        aboutViewController.title = "About"
        tabBarIcons.append(UIImage(systemName: "person.3.fill"))
        
        setViewControllers([searchViewController, aboutViewController], animated: false)
        
        // This part envolves the View portion of this module
        // Set the icon for each tab
        if let tabBarItems = tabBar.items {
            for (i, item) in tabBarItems.enumerated() {
                item.image = tabBarIcons[i]
            }
        }
        
    }

}
