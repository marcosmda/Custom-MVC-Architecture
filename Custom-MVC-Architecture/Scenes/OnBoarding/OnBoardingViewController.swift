//
//  OnBoardingViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class OnBoardingViewController: BaseViewController<OnBoardingView> {
    
    init() {
        super.init(mainView: OnBoardingView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.finishButton.addTarget(self, action: #selector(segueToSearch), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Hides the navigationBar
        if let navigationController = navigationController {
            navigationController.setNavigationBarHidden(true, animated: true)
        }
    }
    
    @objc private func segueToSearch() {
        // Removes the OnBoardingViewController from the UINavigationController
        // and adds the SearchViewController
        if let navigationController = navigationController {
            navigationController.setViewControllers([TabBarController()], animated: true)
        }
    }

}
