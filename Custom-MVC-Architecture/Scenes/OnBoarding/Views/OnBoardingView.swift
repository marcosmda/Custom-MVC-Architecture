//
//  OnBoardingView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class OnBoardingView: UIView {
    
    /// The Button that closes the onboarrding page
    var finishButton = UIButton()
    
    /// The label where onboarding's text will be presented
    var onBoardingLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    /// Add all subviews created inside the self
    func addSubviews() {
        addSubview(finishButton)
        addSubview(onBoardingLabel)
    }
    
    /// Call the setups for all the views, including Constraints and Styles
    func setupView() {
        self.backgroundColor = UIColor(red: 1, green: 0.4, blue: 0.35, alpha: 1)
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
}

// MARK: - Extension: Setup Elements Styles
extension OnBoardingView {
    
    /// Main Method of extension, used to setup all element styles
    func setupAllStyles() {
        setupFinishButtonStyle()
        setupOnBoardingLabelStyle()
    }
    
    /// Sets the Finish Button style and title
    func setupFinishButtonStyle() {
        finishButton.setTitle("Fechar OnBoarding", for: .normal)
        finishButton.setTitleColor(.systemGray4, for: .normal)
        finishButton.backgroundColor = .black
        finishButton.layer.cornerRadius = Constants.cornerRadius
    }
    
    /// Sets the Onboarding Label style and text
    func setupOnBoardingLabelStyle() {
        onBoardingLabel.text = "Bem vindo ao nosso Modelo de Arquitetura, aqui você não vai fazer nada, mas vai ser legal 🤪"
        onBoardingLabel.textAlignment = .center
        onBoardingLabel.textColor = .black
        onBoardingLabel.numberOfLines = .max
    }
    
}

// MARK: - Extension: Setup Constraints
extension OnBoardingView {
    
    /// Main Method of extension, used to setup all constraints
    func setupAllConstraints() {
        setupFinishButtonConstraints()
        setupOnBoardingLabelConstraints()
    }
    
    /// Sets the Finish Button Constraints
    func setupFinishButtonConstraints() {
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        finishButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        finishButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32).isActive = true
        finishButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    /// Sets the Onboarding Label Constraints
    func setupOnBoardingLabelConstraints() {
        onBoardingLabel.translatesAutoresizingMaskIntoConstraints = false
        onBoardingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        onBoardingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        onBoardingLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        onBoardingLabel.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: 30).isActive = true
    }
    
}
