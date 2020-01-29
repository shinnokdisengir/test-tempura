//
//  AuthActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana
import Hydra

struct SaveSession: StateUpdater {
    
    var username: String
    var authentication: Authentication

    func updateState(_ currentState: inout AppState) {
        currentState.session.username = self.username
        currentState.session.authentication = self.authentication
        currentState.session.logged = true
    }
}
