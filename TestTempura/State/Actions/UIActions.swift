//
//  UIActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 28/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import Katana
import Hydra

struct SetLoading: StateUpdater {
    var loading: Bool

    func updateState(_ currentState: inout AppState) {
        currentState.ui.loading = self.loading
    }
}
