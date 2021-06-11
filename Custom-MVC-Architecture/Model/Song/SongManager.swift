//
//  SongManager.swift
//  Custom-MVC-Architecture
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/06/21.
//

import Foundation

//By convention, protocols are created in the same files we use them
protocol SongManagerDelegate {
    func didUpdateModel(_ songManager: SongManager, song: [SongModel])
    func didFailWithError(error: Error)
}

class SongManager {
    
    var delegate: SongManagerDelegate?
    
    var task: URLSessionDataTask?
    
    let baseUrl = "https://itunes.apple.com/search?limit=10&"
    let termBase = "term="
    let entityBase = "entity="
    
    //MARK: - Methods
    func fetchSong(term: String) {
        let validatedTerm = validadeRequestTerm(term: term)
        let urlString = baseUrl + termBase + validatedTerm
        performRequest(with: urlString)
    }
    
    func fetchSong(term: String, entity: String) {
        let validatedTerm = validadeRequestTerm(term: term)
        let urlString = baseUrl + termBase + validatedTerm + "&" + entityBase + entity
        performRequest(with: urlString)
    }
    
    /// Replaces any white space with a "+"
    func validadeRequestTerm(term: String) -> String {
        return term
            .components(separatedBy: " ")
            .filter { !$0.isEmpty }
            .joined(separator: "+")
    }
    
    func performRequest(with urlStirng: String) {
        guard let url = URL(string: urlStirng) else { return }
        
        let session = URLSession(configuration: .default)
        
        task?.cancel()
        task = session.dataTask(with: url) { data, _, error in
            if let safeError = error {
                self.delegate?.didFailWithError(error: safeError)
                return
            }
            if let safeData = data {
                if let song = self.parseJSON(safeData) {
                    DispatchQueue.main.async {
                        self.delegate?.didUpdateModel(self, song: song)
                    }
                }
            }
        }
        task?.resume()
}
    
    func parseJSON(_ songResult: Data) -> [SongModel]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let decodedDataResult = try decoder.decode(SongResult.self, from: songResult)
                        
            return decodedDataResult.results.map{ SongModel(songData: $0) }

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
}
