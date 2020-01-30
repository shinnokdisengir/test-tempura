//
//  HomeView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 30/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura
import UIKit

// MARK: - View Model

struct HomeViewModel: ViewModelWithLocalState, Equatable {
    var session: SessionModel
    
    init?(state: AppState?, localState: HomeLocalState) {
        guard let state = state else { return nil }
        self.session = state.session
    }
    
    static func == (l: HomeViewModel, r: HomeViewModel) -> Bool {
        if l.session != r.session { return false }
        return true
    }
}

// MARK: - List sections

extension HomeView {
    enum Section {
//    case todo
//    case archived
    }
}

class HomeView: UIView, ViewControllerModellableView {
    
    // MARK: - Subviews
    var topbarView: UIView = UIView()
    var contentView: UIView = UIView()
    
    var scrollView: UIScrollView = UIScrollView()
    var titleLabel: UIView = UIView()
    var actionButton: UIButton = UIButton(type: .custom)
    
    // MARK: - Interactions
    var didTapNext: Interaction?
    
    
    // MARK: - Setup
    
    func setup() {
        debugPrint("Home view setup")
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
    
    func update(oldModel: HomeViewModel?) {
        guard let _ = self.model, oldModel != self.model else { return }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {}
}

// MARK: - Styling

extension HomeView {}
