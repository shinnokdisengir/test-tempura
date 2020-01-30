//
//  SessionModel.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import UIKit

struct Authentication {
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    let scope: String?
    let refreshToken: String
}

struct SessionModel: Equatable {
    var username: String?
    var authentication: Authentication?
    var logged: Bool = false
    var wizardCompleted: Bool = false

    var isLogged: Bool {
        return self.logged
    }
    
    var isWizardCompleted: Bool {
        return self.wizardCompleted
    }

    static func == (l: SessionModel, r: SessionModel) -> Bool {
        return l.username == r.username && l.logged == r.logged
    }
}
