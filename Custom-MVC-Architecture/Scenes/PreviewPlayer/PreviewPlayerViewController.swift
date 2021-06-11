//
//  PreviewPlayerViewController.swift
//  Custom-MVC-Architecture
//
//  Created by Frederico Lacis de Carvalho on 11/06/21.
//

import UIKit

class PreviewPlayerViewController: BaseViewController<PreviewPlayerView> {
    
    var songInfo: SongModel
    
    let player = PlayerViewComponent()
    
    init(songInfo: SongModel) {
        self.songInfo = songInfo
        super.init(mainView: PreviewPlayerView(frame: UIScreen.main.bounds, songInfo: songInfo, playerView: player.mainView))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
