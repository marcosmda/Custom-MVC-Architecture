//
//  AboutView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 10/06/21.
//

import UIKit

class AboutView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {

    }
    
    func setupView() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)

    }
    
}

// MARK: - Extension: Setup Elements Styles
extension AboutView {
    
    func setupAllStyles() {

    }
    
}

// MARK: - Extension: Setup Constraints
extension AboutView {
    
    func setupAllConstraints() {

    }
    
}
