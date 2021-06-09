//
//  OnBoardingView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class OnBoardingView: UIView {
    
    //MARK: - Properties
    /// The Button that closes the onboarrding page
    var finishButton = UIButton()
    
    /// The label where onboarding's text will be presented
    var onboardingLabel = UILabel()

    //MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    //MARK: - Methods
    
    /// Add all subviews created inside the self
    func addSubviews() {
        addSubview(finishButton)
        addSubview(onboardingLabel)
    }
    
    /// Call the setups for all the views, including Constraints and Styles
    func setUpView() {
        self.backgroundColor = UIColor(red: 1, green: 0.4, blue: 0.35, alpha: 1)
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
}

// MARK: - Extension: SetUp Elements Styles
extension OnBoardingView {
    
    /// Main Method of extension, used to setup all element styles
    func setupAllStyles() {
        setupFinishButtonStyle()
        setupOnboardingLabelStyle()
    }
    
    /// Sets the Finish Button style and title
    func setupFinishButtonStyle() {
        finishButton.setTitle("Fechar OnBoarding", for: .normal)
        finishButton.setTitleColor(.systemGray4, for: .normal)
        finishButton.backgroundColor = .black
        finishButton.layer.cornerRadius = 16
    }
    
    /// Sets the Onboarding Label style and text
    func setupOnboardingLabelStyle() {
        onboardingLabel.text = "Bem vindo ao nosso Modelo de Arquitetura, aqui você não vai fazer nada, mas vai ser legal 🤪"
        onboardingLabel.textAlignment = .center
        onboardingLabel.textColor = .black
        onboardingLabel.numberOfLines = .max
    }
    
}

// MARK: - Extension: SetUp Constraints
extension OnBoardingView {
    
    /// Main Method of extension, used to setup all constraints
    func setupAllConstraints() {
        setupFinishButtonConstraints()
        setupOnboardingLabelConstraints()
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
    func setupOnboardingLabelConstraints() {
        onboardingLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        onboardingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        onboardingLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        onboardingLabel.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: 30).isActive = true
    }
    
}
