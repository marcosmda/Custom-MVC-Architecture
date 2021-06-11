//
//  PlayerViewComponentView.swift
//  Custom-MVC-Architecture
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/06/21.
//

import UIKit

class PlayerComponentView: UIView {
    
    let playButton = UIButton()
    
    let forwardButton = UIButton()
    
    let backwardButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addSubviews() {
        addSubview(playButton)
        addSubview(forwardButton)
        addSubview(backwardButton)
    }
    
    func setupView() {
        backgroundColor = .systemGray2
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
} 

// MARK: - Extension: Setup Elements Styles
extension PlayerComponentView {
    
    func setupAllStyles() {
        setupPlayButtonStyle()
        setupForwardButtonStyle()
        setupBackwardButtonStyle()
    }
    
    func setupPlayButtonStyle() {
        let buttonImage = UIImage(systemName: "play.circle.fill")
        playButton.setBackgroundImage(buttonImage, for: .normal)
        playButton.tintColor = .systemPurple
    }
    
    func setupForwardButtonStyle() {
        let buttonImage = UIImage(systemName: "forward.fill")
        forwardButton.setBackgroundImage(buttonImage, for: .normal)
        forwardButton.tintColor = .systemPurple
    }
    
    func setupBackwardButtonStyle() {
        let buttonImage = UIImage(systemName: "backward.fill")
        backwardButton.setBackgroundImage(buttonImage, for: .normal)
        backwardButton.tintColor = .systemPurple
    }

}

// MARK: - Extension: Setup Constraints
extension PlayerComponentView {
    
    func setupAllConstraints() {
        setupPlayButtonConstraints()
        setupForwardButtonConstraints()
        setupBackwardButtonConstraints()
    }
    
    func setupPlayButtonConstraints() {
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupForwardButtonConstraints() {
        forwardButton.translatesAutoresizingMaskIntoConstraints = false
        forwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        forwardButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: Constants.padding).isActive = true
        forwardButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        forwardButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupBackwardButtonConstraints() {
        backwardButton.translatesAutoresizingMaskIntoConstraints = false
        backwardButton.centerYAnchor.constraint(equalTo: playButton.centerYAnchor).isActive = true
        backwardButton.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -Constants.padding).isActive = true
        backwardButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backwardButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
