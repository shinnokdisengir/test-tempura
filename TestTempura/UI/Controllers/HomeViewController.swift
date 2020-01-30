//
//  HomeViewController.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 30/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Katana
import Tempura

// MARK: - Local State

struct HomeLocalState: LocalState {}

// MARK: - ViewController

class HomeViewController: ViewControllerWithLocalState<HomeView> {
    init(store: PartialStore<AppState>) {
        super.init(store: store, localState: HomeLocalState(), connected: false)
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

extension HomeViewController: RoutableWithConfiguration {
    var routeIdentifier: RouteElementIdentifier {
        return Screen.home.rawValue
    }

    var navigationConfiguration: [NavigationRequest: NavigationInstruction] {
        return [
            .hide(Screen.home): .dismissModally(behaviour: .hard),
        ]
    }
}
