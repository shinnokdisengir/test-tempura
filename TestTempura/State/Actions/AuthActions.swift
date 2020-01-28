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
            // TODO: - Aggiungere lo spinner di caricamento
            let response = try await(currentState.service.auth.login(withUsername: self.username, andPassword: self.password))
            currentState.session.username = username
            currentState.session.authentication = response
            currentState.session.logged = true
        } catch ServiceError.invalidAuthentication  {
            debugPrint("invalidAuthentication")
            currentState.session.logged = false
        } catch ServiceError.generic(let code, let message) {
            debugPrint(code, message)
            currentState.session.logged = false
        } catch {
            debugPrint("BOH error")
            currentState.session.logged = false
        }
    }
}
