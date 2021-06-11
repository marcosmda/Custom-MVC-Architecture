//
//  PreviewPlayerView.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 11/06/21.
//

import UIKit

class PreviewPlayerView: UIView {

    var playerView: PlayerComponentView {
        didSet {
            setupView()
        }
    }
    
    var songInfo: SongModel
    
    let songArtworkImage = UIImageView()
    
    init(frame: CGRect, songInfo: SongModel, playerView: PlayerComponentView) {
        self.songInfo = songInfo
        self.playerView = playerView
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    /// Add all subviews created inside the self
    func addSubviews() {
        addSubview(playerView)
        addSubview(songArtworkImage)
    }
    
    /// Call the setups for all the views, including Constraints and Styles
    func setupView() {
        backgroundColor = .systemGray6
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }
    
}

// MARK: - Extension: Setup Elements Styles
extension PreviewPlayerView {
    
    /// Main Method of extension, used to setup all element styles
    func setupAllStyles() {
        setupSongArtworkImageStyle()
    }
    
    func setupSongArtworkImageStyle() {
        if let artworkURLString = songInfo.artworkUrl100,
           let artworkURL = URL(string: artworkURLString) {
            songArtworkImage.load(url: artworkURL)
            songArtworkImage.layer.cornerRadius = 10
            songArtworkImage.clipsToBounds = true
        }
    }
    
}

// MARK: - Extension: Setup Constraints
extension PreviewPlayerView {
    
    /// Main Method of extension, used to setup all constraints
    func setupAllConstraints() {
        setupPlayerConstraints()
        setupSongArtworkImageConstraints()
    }
    
    func setupPlayerConstraints() {
        playerView.translatesAutoresizingMaskIntoConstraints = false
        playerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        playerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        playerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        playerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupSongArtworkImageConstraints() {
        songArtworkImage.translatesAutoresizingMaskIntoConstraints = false
        songArtworkImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        songArtworkImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        songArtworkImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        songArtworkImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

//    func setupOnBoardingLabelConstraints() {
//        onBoardingLabel.translatesAutoresizingMaskIntoConstraints = false
//        onBoardingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        onBoardingLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
//        onBoardingLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
//        onBoardingLabel.bottomAnchor.constraint(equalTo: finishButton.topAnchor, constant: 30).isActive = true
//    }
    
}

