//
//  SplashView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 29/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import UIKit
import PinLayout
import Hydra
import Tempura
import Hero

struct SplashViewModel: ViewModelWithLocalState {
    init?(state: AppState?, localState: SplashLocalState) {
    }
}


class SplashView: UIView, ViewControllerModellableView {
    
    // MARK: - Subviews
    
    var catImage: UIImageView = UIImageView(image: UIImage(named: "logo-cat"))
    var catImageSleep: UIImageView = UIImageView(image: UIImage(named: "logo-cat-sleep"))
    var textImage: UIImageView = UIImageView(image: UIImage(named: "logo-text"))
    
    // MARK: - Setup
    
    func setup() {
        
        self.catImage.hero.id = "logo-cat"
        self.textImage.hero.id = "logo-text"
        
        self.addSubview(self.catImage)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = Palette.mainColor
        
        self.catImage.contentMode = .scaleAspectFit
    }
    
    // MARK: - Update
    
    func update(oldModel: SplashViewModel?) {
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        self.catImage.pin
            .hCenter()
            .top(pin.safeArea)
            .bottom(pin.safeArea)
            .width(200)
    }
}

// MARK: - Styling

extension SplashView {}
