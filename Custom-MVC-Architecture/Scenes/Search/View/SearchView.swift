//
//  SearchView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchView: UIView {

    var searchBar: UISearchBar {
        let searchBar = UISearchBar()
        return searchBar
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = .systemBlue
        
        self.addSubview(searchBar)
    }
    
}
