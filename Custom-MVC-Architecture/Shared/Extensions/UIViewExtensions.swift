//
//  UIViewExtensions.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 09/06/21.
//

import UIKit

extension UIView {
    
    func alignToParentView(_ view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
}
