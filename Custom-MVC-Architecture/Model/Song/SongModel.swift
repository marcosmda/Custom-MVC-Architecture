//
//  SongModel.swift
//  iTunesAPI_MVVM-C
//
//  Created by Marcos Vinicius Majeveski De Angeli on 07/06/21.
//

import Foundation

struct SongModel {
    
    ///The name of the artist returned by the search request.
    let artistName: String
    
    ///The name of the track, song, video, TV episode, and so on returned by the search request.
    let trackName: String
    
    ///A URL referencing the 30-second preview file for the content associated with the returned media type.
    let previewUrl: String?
}


