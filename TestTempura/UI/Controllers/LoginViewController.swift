//
//  LoginViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Hydra
import Katana
import Tempura

// MARK: - Local State

struct LoginLocalState: LocalState {
    //  var selectedSection: RootView.Section = .todo
}

// MARK: - ViewController

class LoginViewController: ViewControllerWithLocalState<LoginView> {
    init(store: PartialStore<AppState>) {
        super.init(store: store, localState: LoginLocalState(), connected: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//      self.rootView.textField.becomeFirstResponder()
    }

    override func setup() {}

    override func setupInteraction() {
        self.rootView.didTapLogin = { [unowned self] auth in
            // Login procedure
            async(in: .background) {
                // Loading
                self.dispatch(SetLoading(loading: true))
                do {
                    let authentication = try await(Http.login(withUsername: auth.0, andPassword: auth.1))
                    self.dispatch(SaveSession(username: auth.0, authentication: authentication))
                } catch HttpError.invalidAuthentication {
                    debugPrint("invalidAuthentication")
//                    currentState.session.logged = false
                } catch let HttpError.generic(code, message) {
                    debugPrint(code, message as Any)
//                    currentState.session.logged = false
                } catch {
                    debugPrint("BOH error")
//                    currentState.session.logged = false
                }
                // Stop loading
                self.dispatch(SetLoading(loading: false))
            }
        }
        self.rootView.didLoggedIn = { [unowned self] in
            self.dispatch(Hide(animated: true, context: nil, atomic: true))
        }
    }
}

// MARK: - Routing

extension LoginViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.login.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
            .hide(Screen.login): .dismissModally(behaviour: .hard),
        ]
    }
}
