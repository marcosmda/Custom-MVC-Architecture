//
//  OnBoardingView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class OnBoardingView: UIView {
    
    var finishButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func addSubviews() {
        addSubview(finishButton)
    }
    
    func setUpView() {
        self.backgroundColor = .systemPink
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
}

// MARK: - SetUp Elements Styles
extension OnBoardingView {
    
    func setupAllStyles() {
        setupFinishButtonStyle()
    }
    
    func setupFinishButtonStyle() {
        finishButton.setTitle("Finish OnBoarding", for: .normal)
        finishButton.setTitleColor(.systemGray4, for: .normal)
        finishButton.backgroundColor = .black
        finishButton.layer.cornerRadius = 16
    }
    
}

// MARK: - SetUp Constraints
extension OnBoardingView {
    
    func setupAllConstraints() {
        setupFinishButtonConstraints()
    }

    func setupFinishButtonConstraints() {
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        finishButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32).isActive = true
        finishButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
}
