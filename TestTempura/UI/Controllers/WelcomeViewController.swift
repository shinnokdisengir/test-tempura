//
//  WizardViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura
import Katana

// MARK: - Local State

struct WelcomeLocalState: LocalState {
    //  var selectedSection: RootView.Section = .todo
}

// MARK: - ViewController

class WelcomeViewController: ViewControllerWithLocalState<WelcomeView> {

    init(store: PartialStore<AppState>) {
      super.init(store: store, localState: WelcomeLocalState(), connected: false)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
//      self.rootView.textField.becomeFirstResponder()
    }
    
    override func setup() {}

    override func setupInteraction() {}
}

// MARK: - Routing

extension WelcomeViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.welcome.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
            .hide(Screen.welcome): .dismissModally(behaviour: .hard),
        ]
    }
}
