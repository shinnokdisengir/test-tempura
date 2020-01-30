//
//  WizardWelcomeViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 30/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Hero
import Katana
import Tempura

// MARK: - Local State

struct WizardWelcomeLocalState: LocalState {}

// MARK: - ViewController

class WizardWelcomeViewController: ViewControllerWithLocalState<WizardWelcomeView> {
    
    init(store: PartialStore<AppState>) {
        super.init(store: store, localState: WizardWelcomeLocalState(), connected: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func setup() {
        self.isHeroEnabled = true
    }

    override func setupInteraction() {}
}

// MARK: - Routing

extension WizardWelcomeViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.wizardWelcome.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
            .hide(Screen.splash): .dismissModally(behaviour: .hard),
        ]
    }
}
