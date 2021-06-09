//
//  SearchViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchViewController: BaseViewController<SearchView> {
    
    var songManager = SongManager()
    
    init() {
        super.init(mainView: SearchView())
        
        songManager.delegate = self
        mainView.searchBar.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

extension SearchViewController: SongManagerDelegate {
    
    func didUpdateModel(_ songManager: SongManager, song: SongModel) {
        print(song.artistName)
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchTerm = searchBar.text {
            songManager.fetchSong(term: searchTerm)
        }
    }
}
