//
//  SearchViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 08/06/21.
//

import UIKit

class SearchViewController: BaseViewController<SearchView> {
    
    /// The manager that makes requests from the API and parses it to SongModels
    var songManager = SongManager()
    
    /// Songs fetched from the API
    var fetchedSongs: [SongModel] = [] {
        didSet {
            // Whenever new songs are fetched, update the tableView
            DispatchQueue.main.async {
                self.mainView.searchResultTableView.reloadData()
            }
        }
    }
    
    var lastTypedTimer: Timer?
    
    init() {
        super.init(mainView: SearchView())
        setupDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hides the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // Sets up all the delegates of the View Controller
    func setupDelegates() {
        songManager.delegate = self
        mainView.searchBar.delegate = self
        mainView.searchResultTableView.delegate = self
        mainView.searchResultTableView.dataSource = self
        mainView.searchResultTableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultTableViewCell")
    }
    
}

// MARK: - Song Manager Delegate Methods
extension SearchViewController: SongManagerDelegate {
    
    // Method triggered when the request has finished fetching from the API
    func didUpdateModel(_ songManager: SongManager, song: [SongModel]) {
        fetchedSongs = song
    }
    
    // Method triggered when there is an Error in the request from the API
    func didFailWithError(error: Error) {
        fetchedSongs = []
    }
}

// MARK: - Search Bar Delegate Methods
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        lastTypedTimer?.invalidate()
        
        if let searchTerm = searchBar.text {
            lastTypedTimer = Timer.scheduledTimer(withTimeInterval: searchTerm.last == " " ? 0.1 : 1,
                                                  repeats: false, block: { _ in
                self.songManager.fetchSong(term: searchTerm)
            })
        }
    }
    
}

// MARK: - Table View Delegate Methods
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell", for: indexPath) as? SearchResultTableViewCell {
            cell.songInfo = fetchedSongs[indexPath.row]
            return cell
        } else {
            fetchedSongs.remove(at: indexPath.row)
        }
       return SearchResultTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Method used to do an action when a cell is clicked
        let touchedSong = fetchedSongs[indexPath.row]
        if let navigationController = navigationController {
            navigationController.present(PreviewPlayerViewController(songInfo: touchedSong), animated: true)
        }
    }
    
}
