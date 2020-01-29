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

struct SplashViewModel: ViewModelWithLocalState {
    init?(state: AppState?, localState: SplashLocalState) {
    }
}

// MARK: - List sections

extension WelcomeView {
}


class SplashView: UIView, ViewControllerModellableView {
    // MARK: - Subviews
    
    var catImage: UIImageView = UIImageView(image: UIImage(named: "logo-cat"))
    var catImageSleep: UIImageView = UIImageView(image: UIImage(named: "logo-cat-sleep"))
    var textImage: UIImageView = UIImageView(image: UIImage(named: "logo-text"))
    
    // MARK: - Interactions
    var didEndSplash: Interaction?
    
    // MARK: - Setup
    
    func setup() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [unowned self] _ in
            self.didEndSplash?()
        }
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
