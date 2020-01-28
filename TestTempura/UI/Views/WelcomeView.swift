//
//  WizardView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura
import UIKit

// MARK: - View Model

struct WelcomeViewModel: ViewModelWithLocalState, Equatable {
    var session: SessionModel
    
    init?(state: AppState?, localState: WelcomeLocalState) {
        guard let state = state else { return nil }
        self.session = state.session
    }
    
    static func == (l: WelcomeViewModel, r: WelcomeViewModel) -> Bool {
        if l.session != r.session { return false }
        return true
    }
}

// MARK: - List sections

extension WelcomeView {
    enum Section {
//    case todo
//    case archived
    }
}

class WelcomeView: UIView, ViewControllerModellableView {
    
    // MARK: - Subviews
    
    var scrollView: UIScrollView = UIScrollView()
    var titleLabel: UIView = UIView()
    var actionButton: UIButton = UIButton(type: .custom)
    
    // MARK: - Interactions
    var didTapNext: Interaction?
    
    
    // MARK: - Setup
    
    func setup() {
        debugPrint("Welcome view setup")
        self.scrollView.isPagingEnabled = true
        self.scrollView.isScrollEnabled = false
        
        self.actionButton.on(.touchUpInside) { [unowned self] _ in
            guard let _ = self.model else { return }
        }
        
        self.scrollView.addSubview(self.titleLabel)
        self.addSubview(self.scrollView)
        self.addSubview(self.actionButton)
    }
    
    // MARK: - Style
    
    func style() {
        self.backgroundColor = .white
    }
    
    // MARK: - Update
    
    func update(oldModel: WelcomeViewModel?) {
        guard let _ = self.model, oldModel != self.model else { return }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {}
}

// MARK: - Styling

extension WelcomeView {}
