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
    
    init?(state: AppState?, localState: RootLocalState) {
        guard let state = state else { return nil }
        self.session = state.session
    }
    
    static func == (l: RootViewModel, r: RootViewModel) -> Bool {
        if l.session != r.session { return false }
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
    
    var username: UILabel = UILabel()
    
    // MARK: - Interactions
    
    var didWizard: Interaction?
    
    // MARK: - Setup
    
    func setup() {
        debugPrint("Root view setup")
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = false
        
        self.actionButton.on(.touchUpInside) { [unowned self] _ in
            guard let model = self.model else { return }
            self.didWizard?()
        }
        
//        self.addSubview(self.scrollView)
        self.addSubview(self.actionButton)
        self.addSubview(self.username)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = .green
        self.actionButton.alpha = 1.0
        self.actionButton.setTitleColor(.black, for: .normal)
    }
    
    // MARK: - Update
    
    func update(oldModel: RootViewModel?) {
        guard let model = self.model, oldModel != self.model else { return }
//        if (model.session.authentication != nil)
        debugPrint(model.session.authentication?.accessToken)
        self.username.text = model.session.authentication?.accessToken
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        self.actionButton.pin.left().right().marginTop(24).height(50)
        self.actionButton.setTitle("Welcome", for: .normal)
        self.username.pin.bottom().left().right().height(50)
        self.username.text = "egrger"
        
    }
}

// MARK: - Styling

extension RootView {}
