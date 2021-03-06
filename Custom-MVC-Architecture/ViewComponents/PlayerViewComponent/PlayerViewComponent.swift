//
//  PlayerViewComponent.swift
//  Custom-MVC-Architecture
//
//  Created by Marcos Vinicius Majeveski De Angeli on 09/06/21.
//

import UIKit

class PlayerViewComponent: BaseViewController<PlayerComponentView> {
    
    init() {
        super.init(mainView: PlayerComponentView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
