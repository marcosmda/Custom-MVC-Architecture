//
//  SearchView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchView: UIView {

    //MARK: - Properties
    var searchBar = UISearchBar()

    //MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func addSubviews() {
        addSubview(searchBar)
    }
    
    func setupView() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
}

// MARK: - Extension: SetUp Elements Styles
extension SearchView {
    
    func setupAllStyles() {
        setupSearchBarStyle()
    }
    
    func setupSearchBarStyle(){
        searchBar.text = "Blinding+Lights"
    }
    
}

// MARK: - Extension: SetUp Constraints
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
