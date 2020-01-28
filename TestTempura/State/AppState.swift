//
//  State.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Katana

struct AppState: State {
    var session: SessionModel = SessionModel()
    // TODO service.auth.login()
    var service: ServiceModel = ServiceModel()
    
}
