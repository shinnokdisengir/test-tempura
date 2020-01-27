//
//  Auth.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import UIKit

struct AuthModel: Equatable {
    var username: String? = nil
    var accessToken: String? = nil
    var logged: Bool = false

    var isLogged: Bool {
        return self.logged
    }
    
    static func == (l: AuthModel, r: AuthModel) -> Bool {
      return l.username == r.username && l.logged == r.logged
    }
}
