//
//  SongManager.swift
//  Custom-MVC-Architecture
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/06/21.
//

import Foundation

//By convention, protocols are created in the same files we use them
protocol SongManagerDelegate {
    func didUpdateModel(_ songManager: SongManager, song: SongModel)
    func didFailWithError(error: Error)
}

struct SongManager {
    
    var delegate: SongManagerDelegate?
    
    let baseUrl = "https://itunes.apple.com/search?limit=10&"
    let termBase = "term="
    let entityBase = "entity="
    
    //MARK: - Methods
    func fetchSong(term: String) {
        let urlString = baseUrl + termBase + term
        performRequest(with: urlString)
    }
    
    func fetchSong(term: String, entity: String) {
        let urlString = baseUrl + termBase + term + "&" + entityBase + entity
        performRequest(with: urlString)
    }
    
    func performRequest(with urlStirng: String) {
        
        if let url = URL(string: urlStirng) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _, error in
             if let safeError = error {
             self.delegate?.didFailWithError(error: safeError)
             return
             }
             dump(data)
             if let safeData = data {
             if let song = self.parseJSON(safeData) {
             DispatchQueue.main.async {
             delegate?.didUpdateModel(self, song: song)
             }
             }
             }
             }
            task.resume()
        }
    }
    
    func parseJSON(_ songResult: Data) -> SongModel?{
        let decoder = JSONDecoder()
        do {
            let decodedDataResult = try decoder.decode(SongResult.self, from: songResult)
            if let decodedData = decodedDataResult.results.first {
                
                //Fill desired properties with the data collected from the request method
                let artistName = decodedData.artistName
                let trackName = decodedData.trackName
                let previewUrl = decodedData.previewUrl
                let collectionName = decodedData.collectionName
                let artworkUrl100 = decodedData.artworkUrl100
                let primaryGenreName = decodedData.primaryGenreName
                
                //Create model to be returned
                let song = SongModel(artistName: artistName, trackName: trackName, previewUrl: previewUrl, collectionName: collectionName, artworkUrl100: artworkUrl100, primaryGenreName: primaryGenreName)
                return song
            } else {
                return nil
            }
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
