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
    
    var containerView: UIView = UIView()
    var logoTextView: UIImageView = UIImageView(image: UIImage(named: "logo-text"))

    // MARK: - Setup
    
    func setup() {
        self.hero.isEnabled = true
        self.logoTextView.hero.id = "logo-text"
        
        self.containerView.addSubview(self.logoTextView)
        self.addSubview(self.containerView)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = Palette.mainColor
        
        self.containerView.backgroundColor = Palette.backgroundColor
        
        self.logoTextView.contentMode = .scaleAspectFit
    }
    
    // MARK: - Update
    
    func update(oldModel: WizardWelcomeViewModel?) {}
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        self.containerView.pin
            .top(pin.safeArea)
            .bottom(pin.safeArea)
            .margin(20)
        self.logoTextView.pin
            .horizontally(16)
            .hCenter()
        
    }
}
