//
//  SongManager.swift
//  Custom-MVC-Architecture
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/06/21.
//

import Foundation

//By convention, protocols are created in the same files we use them
protocol SongManagerDelegate {
    func didUpdateWeather(_ songManager: SongManager, song: SongModel)
    func didFailWithError(error: Error)
}

struct SongManager {
    
    var delegate: SongManagerDelegate
    
    let baseUrl = "https://itunes.apple.com/search?"
    let termBase = "term="
    let entityBase = "entity="
    
    var term: String
    var entity: String

    func performRequest(term: String) {
        
        //url = baseUrl + term
        //fetch(url)
        
    }

}
