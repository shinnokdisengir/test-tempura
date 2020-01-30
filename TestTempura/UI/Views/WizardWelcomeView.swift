//
//  WizardWelcomeView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 30/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import UIKit
import PinLayout
import Hydra
import Tempura
import Hero

struct WizardWelcomeViewModel: ViewModelWithLocalState, Equatable {
    var session: SessionModel
    
    init?(state: AppState?, localState: WizardWelcomeLocalState) {
        guard let state = state else { return nil }
        self.session = state.session
    }
    
    static func == (l: WizardWelcomeViewModel, r: WizardWelcomeViewModel) -> Bool {
        if l.session != r.session { return false }
        return true
    }
}

class WizardWelcomeView: UIView, ViewControllerModellableView {

    // MARK: - Subviews
    
    let safeView = UIView()
    let containerView = UIView()
    let logoTextView = UIImageView(image: UIImage(named: "logo-text"))

    // MARK: - Setup
    
    func setup() {
        self.hero.isEnabled = true
        self.logoTextView.hero.id = "logo-text"
        
        self.containerView.addSubview(self.logoTextView)
        self.safeView.addSubview(self.containerView)
        self.addSubview(self.safeView)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = Palette.mainColor
        
        self.containerView.backgroundColor = Palette.backgroundColor
//        self.containerView.layer
        self.containerView.isOpaque = true
        
        self.logoTextView.contentMode = .scaleAspectFit
    }
    
    // MARK: - Update
    
    func update(oldModel: WizardWelcomeViewModel?) {}
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        self.safeView.pin
            .all(pin.safeArea)
        self.containerView.pin
            .all(16)
        self.logoTextView.pin
            .top(16)
            .hCenter()
            .height(24)
    }
}
