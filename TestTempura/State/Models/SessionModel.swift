//
//  SessionModel.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import UIKit

struct SessionModel: Equatable {
    var username: String?
    var accessToken: String?
    var logged: Bool = false

    var isLogged: Bool {
        return self.logged
    }

    static func == (l: SessionModel, r: SessionModel) -> Bool {
        return l.username == r.username && l.logged == r.logged
    }
}
