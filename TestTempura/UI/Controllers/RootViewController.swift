//
//  RootViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura

// MARK: - Local State

struct RootLocalState: LocalState {
    //  var selectedSection: RootView.Section = .todo
}

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

extension RootViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.root.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
//        .show(Screen.root): .dismissModally(behaviour: .hard),
            .show(Screen.login): .presentModally { [unowned self] _ in
                let c = WelcomeViewController(store: self.store)
                c.modalPresentationStyle = .overCurrentContext
                return c
//            if let editID = context as? String {
//              let ai = AddItemViewController(store: self.store, itemIDToEdit: editID)
//              ai.modalPresentationStyle = .overCurrentContext
//              return ai
//            } else {
//              let ai = AddItemViewController(store: self.store)
//              ai.modalPresentationStyle = .overCurrentContext
//              return ai
//            }
            },
        ]
    }
}
