//
//  SplashViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 29/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Tempura
import Katana

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
//      self.rootView.textField.becomeFirstResponder()
    }
    
    override func setup() {}

    override func setupInteraction() {
        self.rootView.didEndSplash = { [unowned self] in
            self.dispatch(Hide(Screen.splash, animated: false))
        }
    }
}

// MARK: - Routing

extension SplashViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.splash.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
            .hide(Screen.splash): .dismissModally(behaviour: .hard),
        ]
    }
}
