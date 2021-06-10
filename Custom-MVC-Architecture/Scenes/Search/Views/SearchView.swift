//
//  SearchView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchView: UIView {

    var searchBar = UISearchBar()
    
    var searchResultTableView = UITableView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(searchResultTableView)
        addSubview(searchBar)
    }
    
    func setupView() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
}

// MARK: - Extension: Setup Elements Styles
extension SearchView {
    
    func setupAllStyles() {
        setupSearchBarStyle()
        setupSearchResultTableViewStyle()
    }
    
    func setupSearchBarStyle(){
        searchBar.placeholder = "Search for a musical term"
    }
    
    func setupSearchResultTableViewStyle() {
        searchResultTableView.rowHeight = 100
    }
    
}

// MARK: - Extension: Setup Constraints
extension SearchView {
    
    func setupAllConstraints() {
        setupSearchBarConstraints()
        setupSearchResultTableView()
    }
    
    func setupSearchBarConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        searchBar.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0).isActive = true
        searchBar.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
    }
    
    func setupSearchResultTableView() {
        searchResultTableView.translatesAutoresizingMaskIntoConstraints = false
        searchResultTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        searchResultTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        searchResultTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        searchResultTableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
}
