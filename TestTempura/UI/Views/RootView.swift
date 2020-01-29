//
//  RootView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import PinLayout
import Tempura
import UIKit

// MARK: - View Model

struct RootViewModel: ViewModelWithLocalState, Equatable {
    var session: SessionModel
    var ui: UIModel
    
    init?(state: AppState?, localState: RootLocalState) {
        guard let state = state else { return nil }
        self.session = state.session
        self.ui = state.ui
    }
    
    static func == (l: RootViewModel, r: RootViewModel) -> Bool {
        if l.session != r.session { return false }
        if l.ui != r.ui { return false }
        return true
    }
}

// MARK: - List sections

extension RootView {
    enum Section {
//    case todo
//    case archived
    }
}

class RootView: UIView, ViewControllerModellableView {
    // MARK: - Subviews
    
    var actionButton: UIButton = UIButton(type: .custom)
    var scrollView: UIScrollView = UIScrollView()
    var sendToArchiveButton: UIButton = UIButton(type: .custom)
    // the view of the child view controller
    var childViewContainer: ContainerView = ContainerView()
    var loadingView: UIActivityIndicatorView = UIActivityIndicatorView()
    var registerButton: UIButton = UIButton(type: .custom)
    
    var username: UILabel = UILabel()
    
    // MARK: - Interactions
    
    var didLoginTap: Interaction?
    var didRegistrationTap: CustomInteraction<(String, String)>?
    
    // MARK: - Setup
    
    func setup() {
        debugPrint("Root view setup")
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = false
        
        self.actionButton.on(.touchUpInside) { [unowned self] _ in
//            guard let model = self.model else { return }
            self.didLoginTap?()
        }
        
        self.registerButton.on(.touchUpInside) { [unowned self] _ in
            self.didRegistrationTap?(("shinnok@email.it", "feezupfeezup"))
        }
        
        self.addSubview(self.actionButton)
        self.addSubview(self.registerButton)
        self.addSubview(self.username)
        self.addSubview(self.loadingView)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = .green
        self.actionButton.alpha = 1.0
        self.actionButton.setTitleColor(.black, for: .normal)
        self.registerButton.alpha = 1.0
        self.registerButton.setTitleColor(.red, for: .normal)
    }
    
    // MARK: - Update
    
    func update(oldModel: RootViewModel?) {
        guard let model = self.model, oldModel != self.model else { return }
        self.username.text = model.session.authentication?.accessToken
        self.loadingView.alpha = model.ui.loading ? 1.0 : 0
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        
        self.actionButton.pin.left().right().marginTop(24).height(50)
        self.actionButton.setTitle("Login", for: .normal)
        self.registerButton.pin
            .left()
            .right()
            .below(of: self.actionButton)
            .height(50)
        self.registerButton.setTitle("Register", for: .normal)
        self.username.pin
            .bottom()
            .left()
            .right()
            .height(50)
        self.username.text = "egrger"
        self.loadingView.pin.center().size(50)
    }
}

// MARK: - Styling

extension RootView {}
