//
//  LoginViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
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
            self.dispatch(AuthLogin(username: auth.0, password: auth.1))
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
