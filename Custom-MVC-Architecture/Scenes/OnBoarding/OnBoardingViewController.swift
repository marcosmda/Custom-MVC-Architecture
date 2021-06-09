//
//  OnBoardingViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    var mainView = OnBoardingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainView)
        
        mainView.alignToParentView(view)
        
        mainView.finishButton.addTarget(self, action: #selector(segueToSearch), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let navigationController = navigationController {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
    
    @objc private func segueToSearch() {
        navigationController?.show(SearchViewController(), sender: self)
    }

}
