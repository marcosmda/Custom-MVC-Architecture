//
//  SearchViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = SearchView()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
