//
//  SceneViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 09/06/21.
//

import UIKit

class BaseViewController<V: UIView>: UIViewController {
    
    // Todo
    var mainView: V
    
    init(mainView: V) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mainView)
        
        mainView.alignToParentView(view)
    }
    
}
