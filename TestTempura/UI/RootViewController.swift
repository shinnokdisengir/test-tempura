//
//  RootViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura

class RootViewController: ViewControllerWithLocalState<RootView> {
  
  
  override func setup() {
//    self.add(self.childViewController, in: self.rootView.childViewContainer)
  }
  
  // listen for interactions from the view
  // dispatch actions or change the local state in response to user actions
  override func setupInteraction() {
//    self.rootView.didToggleItem = { [unowned self] id in
//      self.dispatch(ToggleItem(itemID: id))
//    }
//    self.rootView.didTapTodoSection = { [unowned self] in
//      if self.localState.selectedSection != .todo {
//        self.localState.selectedSection = .todo
//      }
//    }
//    self.rootView.didTapCompletedSection = { [unowned self] in
//      if self.localState.selectedSection != .archived {
//        self.localState.selectedSection = .archived
//      }
//    }
//    self.rootView.didTapArchive = { [unowned self] toBeArchivedIDs in
//      self.dispatch(ToggleArchiveItems(ids: toBeArchivedIDs))
//    }
//    self.rootView.didUnarchiveItem = { [unowned self] toBeUnarchivedID in
//      self.dispatch(ToggleArchiveItems(ids: [toBeUnarchivedID], archived: false))
//    }
//    self.rootView.didTapAddItem = { [unowned self] in
//      self.dispatch(Show(Screen.addItem))
//    }
//    self.rootView.didTapEditItem = { [unowned self] itemID in
//      self.dispatch(Show(Screen.addItem, animated: false, context: itemID))
//    }
//    self.rootView.didTapClearItems = { [unowned self] in
//      self.dispatch(DeleteArchivedItems())
//    }
  }
}

// MARK: - Local State
struct ListLocalState: LocalState {
//  var selectedSection: RootView.Section = .todo
}


extension RootViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.root.rawValue
    }
    
    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
      return [
        .hide(Screen.root): .dismissModally(behaviour: .hard)
      ]
    }
}
