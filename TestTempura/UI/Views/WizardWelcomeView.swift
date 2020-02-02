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
    
    let logoContainer = UIView()
    let logoIco = UIImageView(image: UIImage(named: "logo-ico"))
    let logoText = UIImageView(image: UIImage(named: "logo-text"))
    
    let textContainer = UIView()
    let tutorial = UILabel()
    
    let formContainer = UIView()
    let username = UITextField()
    let password = UITextField()
    let submit = UIButton()
    
    let socialContainer = UIView()
    let facebook = UIButton()
    let apple = UIButton()
    let google = UIButton()
    
    let topBar = UIView()
    let bottomBar = UIView()
    
    // MARK: - Setup
    
    func setup() {
        self.hero.isEnabled = true
//        self.logoText.hero.id = "logo-text"
        self.logoContainer.addSubview(logoIco)
        self.logoContainer.addSubview(logoText)
        self.safeView.addSubview(self.logoContainer)
        
        self.textContainer.addSubview(tutorial)
        self.safeView.addSubview(self.textContainer)
        
        self.formContainer.addSubview(username)
        self.formContainer.addSubview(password)
        self.formContainer.addSubview(submit)
        self.safeView.addSubview(self.formContainer)
        
        self.socialContainer.addSubview(facebook)
        self.socialContainer.addSubview(apple)
        self.socialContainer.addSubview(google)
        self.safeView.addSubview(self.socialContainer)
        
        
        self.addSubview(self.safeView)
        self.addSubview(self.topBar)
        self.addSubview(self.bottomBar)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = Palette.backgroundColor
        
        self.logoIco.contentMode = .scaleAspectFit
        self.logoText.contentMode = .scaleAspectFit
        
        self.username.layer.cornerRadius = 24
        self.username.keyboardType = .emailAddress
        self.username.font = UIFont(name: "SFDisplay", size: 36)
        self.username.textColor = Palette.darkGreyColor
        self.username.layer.borderColor = Palette.darkGreyColor.cgColor
        self.username.backgroundColor = Palette.lightGreyColor
        
        self.password.layer.cornerRadius = 24
        self.password.layer.borderColor = Palette.darkGreyColor.cgColor
        self.password.textColor = Palette.darkGreyColor
        self.password.backgroundColor = Palette.lightGreyColor
        self.password.isSecureTextEntry = true
        
        self.topBar.backgroundColor = Palette.mainColor
        self.bottomBar.backgroundColor = Palette.mainColor
        self.bottomBar.isOpaque = false
    }
    
    // MARK: - Update
    
    func update(oldModel: WizardWelcomeViewModel?) {}
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        self.topBar.pin
            .top()
            .horizontally()
            .height(48)
        self.bottomBar.pin
            .bottom()
            .horizontally()
            .height(80)
        self.safeView.pin
            .all(pin.safeArea)
        
        self.socialContainer.pin
            .above(of: self.bottomBar)
            .horizontally(80)
            .height(64)
            
        self.formContainer.pin
            .top(50%)
            .above(of: self.socialContainer)
            .hCenter()
            .width(270)
            
        self.username.pin
            .top()
            .horizontally()
            .height(48)
        self.password.pin
            .below(of: self.username)
            .marginTop(16)
            .horizontally()
            .height(48)
//        self.containerView.pin
//            .all(16)
//        self.logoTextView.pin
//            .top(16)
//            .hCenter()
//            .height(24)
    }
}
