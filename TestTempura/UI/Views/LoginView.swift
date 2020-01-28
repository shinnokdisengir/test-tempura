//
//  LoginView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura
import UIKit

// MARK: - View Model

struct LoginViewModel: ViewModelWithLocalState, Equatable {
    var session: SessionModel
    
    init?(state: AppState?, localState: LoginLocalState) {
        guard let state = state else { return nil }
        self.session = state.session
    }
    
    static func == (l: LoginViewModel, r: LoginViewModel) -> Bool {
        if l.session != r.session { return false }
        return true
    }
}

// MARK: - List sections

extension LoginView {
    enum Section {
//    case todo
//    case archived
    }
}

class LoginView: UIView, ViewControllerModellableView {
    
    // MARK: - Subviews
    
    var titleLabel: UILabel = UILabel()
    var actionButton: UIButton = UIButton(type: .custom)
    
    // MARK: - Interactions
    
    var didTapLogin: CustomInteraction<(String, String)>?
    var didLoggedIn: Interaction?
    
    // MARK: - Setup
    
    func setup() {
        debugPrint("Login view setup")
        self.titleLabel.attributedText = NSAttributedString(string: "Login")
        
        self.actionButton.on(.touchUpInside) { [unowned self] _ in
            guard let model = self.model else { return }
            self.didTapLogin?(("admin@feezup.com", "vespachiavarivespa"))
        }
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.actionButton)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = .red
        self.actionButton.alpha = 1.0
    }
    
    // MARK: - Update
    
    func update(oldModel: LoginViewModel?) {
        guard let model = self.model, oldModel != self.model else { return }
        if (model.session.isLogged) { self.didLoggedIn?() }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        self.actionButton.pin.left().right().marginTop(24).height(50)
        self.actionButton.setTitle("Login", for: .normal)
    }
}

// MARK: - Styling

extension LoginView {}
