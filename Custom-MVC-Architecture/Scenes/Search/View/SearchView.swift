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
        setupAllStyles()
        setupAllConstraints()
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
        setupSearchBarConstraints()
    }
    
    func setupSearchBarConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        searchBar.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
    }
    
}
