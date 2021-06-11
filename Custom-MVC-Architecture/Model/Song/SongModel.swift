//
//  SongModel.swift
//  iTunesAPI_MVVM-C
//
//  Created by Marcos Vinicius Majeveski De Angeli on 07/06/21.
//

import Foundation

struct SongModel {
    //MARK: - Properties
    
    ///The name of the artist returned by the search request.
    let artistName: String?
    
    ///The name of the track, song, video, TV episode, and so on returned by the search request.
    let trackName: String?
    
    ///A URL referencing the 30-second preview file for the content associated with the returned media type.
    let previewUrl: String?
    
    ///The name of the album, TV season, audiobook, and so on returned by the search request.
    let collectionName: String?
    
    ///A URL for the artwork associated with the returned media type, sized to 100×100 pixels.
    let artworkUrl100: String?
    
    let primaryGenreName: String?
    
    init(songData: SongData) {
        self.artistName = songData.artistName
        self.trackName = songData.trackName
        self.previewUrl = songData.previewUrl
        self.collectionName = songData.collectionName
        self.artworkUrl100 = songData.artworkUrl100
        self.primaryGenreName = songData.primaryGenreName
    }

}
