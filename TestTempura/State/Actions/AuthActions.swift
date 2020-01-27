//
//  AuthActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana
import Hydra

struct AuthLogin: StateUpdater {
    var username: String
    var password: String

    func updateState(_ currentState: inout AppState) {
        do {
            let response = try await(currentState.service.auth.login(withUsername: self.username, andPassword: self.password))
            debugPrint(response)
        } catch {
            debugPrint("errore")
        }
    }
}

//struct AuthLoggedIn: StateUpdater {
//    var token: String
//
//    func updateState(_ currentState: inout AppState) {
//        currentState.auth.accessToken = self.token
//        currentState.auth.logged = true
//    }
//}
