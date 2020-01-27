//
//  RootView.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import UIKit
import Tempura
import PinLayout

class RootView: UIView, ViewControllerModellableView {
  
  // MARK: - Subviews
  var todoButton: UIButton = UIButton(type: .custom)
  var archiveButton: UIButton = UIButton(type: .custom)
  var actionButton: UIButton = UIButton(type: .custom)
  var scrollView: UIScrollView = UIScrollView()
  var sendToArchiveButton: UIButton = UIButton(type: .custom)
  // the view of the child view controller
  var childViewContainer: ContainerView = ContainerView()
  
  // MARK: - Interactions
  var didTapAddItem: Interaction?
  var didTapClearItems: Interaction?
  var didTapEditItem: ((String) -> ())?
  var didToggleItem: ((String) -> ())?
  var didUnarchiveItem: ((String) -> ())?
  var didTapTodoSection: Interaction?
  var didTapCompletedSection: Interaction?
  var didTapArchive: (([String]) -> ())?
  
  // MARK: - Setup
  func setup() {
    print("setup")
    debugPrint("setup")
    self.scrollView.isPagingEnabled = true
    self.scrollView.isScrollEnabled = false
    
    self.actionButton.on(.touchUpInside) { [unowned self] button in
      guard let model = self.model else { return }
    }
    
    self.addSubview(self.scrollView)
    self.addSubview(self.todoButton)
    self.addSubview(self.archiveButton)
    self.addSubview(self.actionButton)
    self.addSubview(self.sendToArchiveButton)
    self.addSubview(self.childViewContainer)
  }
  
  // MARK: - Style
  func style() {
    self.backgroundColor = .green
  }
  
  // MARK: - Update
  func update(oldModel: RootViewModel?) {
    guard let model = self.model, oldModel != self.model else { return }
}

  // MARK: - Layout
  override func layoutSubviews() {
  }
}
    


// MARK: - Styling
extension RootView {
  
}

// MARK: - View Model
struct RootViewModel: ViewModelWithLocalState, Equatable {
  var auth: AuthModel
  
  init?(state: AppState?, localState: ListLocalState) {
    guard let state = state else { return nil }
    self.auth = state.auth
  }
  
  static func == (l: RootViewModel, r: RootViewModel) -> Bool {
    if l.auth != r.auth { return false }
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
