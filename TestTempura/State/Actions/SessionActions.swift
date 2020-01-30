//
//  AuthActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Hydra
import Katana

struct WizardStatus: StateUpdater {
    var completed: Bool

    func updateState(_ currentState: inout AppState) {
        currentState.session.wizardCompleted = self.completed
    }
}

struct SaveSession: StateUpdater {
    var username: String
    var authentication: Authentication

    func updateState(_ currentState: inout AppState) {
        currentState.session.username = self.username
        currentState.session.authentication = self.authentication
        currentState.session.logged = true
    }
}

struct ReadSession: StateUpdater {
    func updateState(_ currentState: inout AppState) {
        let defaults = UserDefaults.standard
        // Check not already logged
        guard defaults.string(forKey: "username") != nil,
            defaults.string(forKey: "accessToken") != nil,
            defaults.integer(forKey: "expiresIn") != 0,
            defaults.string(forKey: "tokenType") != nil,
            defaults.string(forKey: "refreshToken") != nil else { return }
        
        // Write session
        currentState.session.username = defaults.string(forKey: "username")
        currentState.session.authentication = Authentication(
            accessToken: defaults.string(forKey: "accessToken")!,
            expiresIn: defaults.integer(forKey: "expiresIn"),
            tokenType: defaults.string(forKey: "tokenType")!,
            scope: defaults.string(forKey: "scope"),
            refreshToken: defaults.string(forKey: "refreshToken")!)
    }
}

struct WriteSession: StateUpdater {
    func updateState(_ currentState: inout AppState) {
        let defaults = UserDefaults.standard
        guard currentState.session.username != nil else { return }
        defaults.set(currentState.session.username, forKey: "username")
        defaults.set(currentState.session.authentication!.accessToken, forKey: "accessToken")
        defaults.set(currentState.session.authentication!.expiresIn, forKey: "expiresIn")
        defaults.set(currentState.session.authentication!.tokenType, forKey: "tokenType")
        defaults.set(currentState.session.authentication!.scope, forKey: "scope")
        defaults.set(currentState.session.authentication!.refreshToken, forKey: "refreshToken")
        debugPrint("🖊 session saved!")
        defaults.synchronize()
    }
}
