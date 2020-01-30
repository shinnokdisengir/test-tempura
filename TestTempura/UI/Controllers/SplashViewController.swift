//
//  SplashViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 29/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Hero
import Katana
import Tempura

// MARK: - Local State

struct SplashLocalState: LocalState {
    //  var selectedSection: RootView.Section = .todo
}

// MARK: - ViewController

class SplashViewController: ViewControllerWithLocalState<SplashView> {

    init(store: PartialStore<AppState>) {
        super.init(store: store, localState: SplashLocalState(), connected: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [unowned self] _ in
//            self.dispatch(Hide())
//            self.dismiss(animated: false)
            self.view.isHidden = true
        }
    }

    override func setup() {
        self.isHeroEnabled = true
    }

    override func setupInteraction() {
    }
}

// MARK: - Routing

extension SplashViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.splash.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
            .hide(Screen.registerLogin): .dismissModally(behaviour: .hard),
        ]
    }
}
