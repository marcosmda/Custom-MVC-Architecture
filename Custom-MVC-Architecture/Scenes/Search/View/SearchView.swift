//
//  SearchView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchView: UIView {

    var searchBar = UISearchBar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func addSubviews() {
        addSubview(searchBar)
    }
    
    func setUpView() {
        self.backgroundColor = .systemBlue
        addSubviews()
    }
    
}

// MARK: - SetUp Elements Styles
extension SearchView {
    
    func setupAllStyles() {
        
    }
    
}

// MARK: - SetUp Constraints
extension SearchView {
    
    func setupAllConstraints() {

    }
    
}
