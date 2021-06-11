//
//  AboutViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 10/06/21.
//

import UIKit

class AboutViewController: BaseViewController<AboutView> {
    
    init() {
        super.init(mainView: AboutView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = .blue
        
    }

}
