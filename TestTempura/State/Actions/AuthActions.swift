//
//  AuthActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana

struct AuthLogin: StateUpdater {
    var username: String

    func updateState(_ currentState: inout AppState) {
        currentState.auth.username = self.username
    }
}

struct AuthLoggedIn: StateUpdater {
    var token: String

    func updateState(_ currentState: inout AppState) {
        currentState.auth.accessToken = self.token
        currentState.auth.logged = true
    }
}
