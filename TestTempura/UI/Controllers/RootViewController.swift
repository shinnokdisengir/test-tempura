//
//  RootViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Hero
import Hydra
import Katana
import Tempura

// MARK: - Local State

struct RootLocalState: LocalState {}

class RootViewController: ViewControllerWithLocalState<RootView> {
    
    var splashViewController: SplashViewController!
    
    override func setup() {

        self.splashViewController = SplashViewController(store: self.store)
        self.add(self.splashViewController, in: self.rootView.childViewContainer)
        
        self.isHeroEnabled = true

        // Read logged session
        self.dispatch(ReadSession())
        
        // Manage splash-screen, not beatiful...
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [unowned self] _ in
            self.splashViewController.view.isHidden = true
            self.splashViewController.removeFromParent()
            
            if !self.store.state.session.isWizardCompleted {
                self.dispatch(Show(Screen.wizardWelcome, animated: true))
                return
            }
        }
    }

    // listen for interactions from the view
    // dispatch actions or change the local state in response to user actions
    override func setupInteraction() {
        self.rootView.didLoginTap = { [unowned self] in
            // Already logged
            guard !self.store.state.session.isLogged else { return }
            self.dispatch(Show(Screen.registerLogin, animated: true))
        }
        self.rootView.didRegistrationTap = { [unowned self] registration in
//            guard !self.store.state.session.isLogged else { return }
            async(in: .background) {
                self.dispatch(SetLoading(loading: true))
                do {
                    let result = try await(Http.register(withEmail: registration.0, andPassword: registration.1))
                    debugPrint(result)
                    let authentication = try await(Http.login(withUsername: registration.0, andPassword: registration.1))
                    debugPrint(authentication)
                    self.dispatch(SaveSession(username: registration.0, authentication: authentication))
                } catch RegistrationError.alreadyRegistered {
                    debugPrint("aready registered")
                } catch RegistrationError.passwordShort {
                    debugPrint("Password too short")
                } catch {
                    debugPrint("generic error")
                }
                self.dispatch(SetLoading(loading: false))
            }
        }
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
            .show(Screen.splash): .presentModally { [unowned self] _ in
                let c = SplashViewController(store: self.store)
                c.modalPresentationStyle = .fullScreen
                return c
            },
            .show(Screen.registerLogin): .presentModally { [unowned self] _ in
                let c = LoginViewController(store: self.store)
                c.modalPresentationStyle = .overCurrentContext
                return c
            },
            .show(Screen.wizardWelcome): .push { [unowned self] _ in
                let c = WizardWelcomeViewController(store: self.store)
                return c
            },
        ]
    }
}
