//
//  SongData.swift
//  Custom-MVC-Architecture
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/06/21.
//

import Foundation

struct SongResult: Codable {
    
    let resultCount: Int
    
    let results: [SongData]
}

struct SongData: Codable {
    
    ///The name of the object returned by the search request.
    ///Values: track, collection, artistFor
    let wrapperType: String?
    
    ///The kind of content returned by the search request.
    ///Values: book, album, coached-audio, feature-movie, interactive- booklet, music-video, pdf podcast, podcast-episode, software-package, song, tv-episode, artist
    let kind: String?
    
    let artistId: Int?
    
    let collectionId: Int?
    
    let trackId: Int?
    
    ///The name of the artist returned by the search request.
    let artistName: String?
    
    ///The name of the album, TV season, audiobook, and so on returned by the search request.
    let collectionName: String?
    
    ///The name of the track, song, video, TV episode, and so on returned by the search request.
    let trackName: String?
    
    ///The name of the album, TV season, audiobook, and so on returned by the search request, with objectionable words *’d out. Note: Artist names are never censored.
    let collectionCensoredName: String?
    
    ///The name of the album, TV season, audiobook, and so on returned by the search request, with objectionable words *’d out. Note: Artist names are never censored.
    let trackCensoredName: String?
    
    ///A URL for the content associated with the returned media type. You can click the URL to view the content in the iTunes Store.
    let artistViewUrl: String?
    
    ///A URL for the content associated with the returned media type. You can click the URL to view the content in the iTunes Store.
    let collectionViewUrl: String?
    
    ///A URL for the content associated with the returned media type. You can click the URL to view the content in the iTunes Store.
    let trackViewUrl: String?
    
    ///A URL referencing the 30-second preview file for the content associated with the returned media type.
    let previewUrl: String?
    
    ///A URL for the artwork associated with the returned media type, sized to 30×30 pixels.
    let artworkUrl30: String?
    
    ///A URL for the artwork associated with the returned media type, sized to 60×60 pixels.
    let artworkUrl60: String?
    
    ///A URL for the artwork associated with the returned media type, sized to 100×100 pixels.
    let artworkUrl100: String?
    
    ///The album price at the iTunes Store
    let collectionPrice: Double?
    
    ///The track price at the iTunes Store
    let trackPrice: Double?
    
    ///The date of release of the returned media
    let releaseDate: Date?
    
    ///The Recording Industry Association of America (RIAA) parental advisory for the content returned by the search request.
    ///Values: explicit (explicit lyrics, possibly explicit album cover), cleaned (explicit lyrics “bleeped out”), notExplicit (no explicit lyrics)
    let collectionExplicitness: String?
    
    ///The Recording Industry Association of America (RIAA) parental advisory for the content returned by the search request.
    ///Values: explicit (explicit lyrics, possibly explicit album cover), cleaned (explicit lyrics “bleeped out”), notExplicit (no explicit lyrics)
    let trackExplicitness: String?
    
    let discCount: Int?
    
    let discNumber: Int?
    
    let trackCount: Int?
    
    let trackNumber: Int?
    
    ///The returned track’s time in milliseconds.
    let trackTimeMillis: Int?
    
    let country: String?
    
    let currency: String?
    
    let primaryGenreName: String?
    
    let isStreamable: Bool?
}
