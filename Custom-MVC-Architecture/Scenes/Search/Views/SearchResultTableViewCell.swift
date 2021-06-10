//
//  SearchResult.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 10/06/21.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    var songInfo: SongModel? {
        didSet {
            setupView()
        }
    }
    
    var songArtworkImage = UIImageView()
    
    var songTitleLabel = UILabel()
    
    var songArtistLabel = UILabel()
    
    var songGenreLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func addSubviews() {
        addSubview(songArtworkImage)
        addSubview(songTitleLabel)
        addSubview(songArtistLabel)
        addSubview(songGenreLabel)
    }
    
    func setupView() {
        addSubviews()
        setupAllStyles()
        setupAllConstraints()
    }

}

// MARK: - Extension: Setup Elements Styles
extension SearchResultTableViewCell {
    
    func setupAllStyles() {
        setupSongArtworkImageStyle()
        setupSongTitleLabelStyle()
        setupSongArtistLabelStyle()
        setupSongGenreLabelStyle()
    }
    
    func setupSongArtworkImageStyle() {
        songArtworkImage.image = UIImage(named: "SearchImagePlaceholder")
        if let songInfo = songInfo,
           let artworkURLString = songInfo.artworkUrl100,
           let artworkURL = URL(string: artworkURLString) {
            songArtworkImage.load(url: artworkURL)
            songArtworkImage.layer.cornerRadius = 10
            songArtworkImage.clipsToBounds = true
        }
    }
    
    func setupSongTitleLabelStyle() {
        if let songInfo = songInfo,
           let trackName = songInfo.trackName {
            songTitleLabel.text = trackName
            songTitleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        }
    }
    
    func setupSongArtistLabelStyle() {
        if let songInfo = songInfo,
           let aristName = songInfo.artistName {
            songArtistLabel.text = aristName
            songArtistLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        }
    }
    
    func setupSongGenreLabelStyle() {
        if let songInfo = songInfo,
           let genre = songInfo.primaryGenreName {
            songGenreLabel.text = genre
            songGenreLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        }
    }

}

// MARK: - Extension: Setup Constraints
extension SearchResultTableViewCell {
    
    func setupAllConstraints() {
        setupSongArtworkImageConstraints()
        setupSongTitleLabelConstraints()
        setupSongArtistLabelConstraints()
        setupSongGenreLabelConstraints()
    }
    
    func setupSongArtworkImageConstraints() {
        songArtworkImage.translatesAutoresizingMaskIntoConstraints = false
        songArtworkImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        songArtworkImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.padding).isActive = true
        songArtworkImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        songArtworkImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func setupSongTitleLabelConstraints() {
        songTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        songTitleLabel.leadingAnchor.constraint(equalTo: songArtworkImage.trailingAnchor, constant: Constants.padding).isActive = true
        songTitleLabel.topAnchor.constraint(equalTo: songArtworkImage.topAnchor).isActive = true
    }
    
    func setupSongArtistLabelConstraints() {
        songArtistLabel.translatesAutoresizingMaskIntoConstraints = false
        songArtistLabel.topAnchor.constraint(equalTo: songTitleLabel.bottomAnchor, constant: Constants.padding / 2).isActive = true
        songArtistLabel.leadingAnchor.constraint(equalTo: songTitleLabel.leadingAnchor).isActive = true
    }
    
    func setupSongGenreLabelConstraints() {
        songGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        songGenreLabel.topAnchor.constraint(equalTo: songArtistLabel.bottomAnchor, constant: Constants.padding / 2).isActive = true
        songGenreLabel.leadingAnchor.constraint(equalTo: songArtistLabel.leadingAnchor).isActive = true
    }
    
}
