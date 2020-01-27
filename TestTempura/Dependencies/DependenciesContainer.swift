//
//  DependenciesContainer.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana
import Tempura

final class DependenciesContainer: NavigationProvider {
    let promisableDispatch: PromisableStoreDispatch

    var getAppState: () -> AppState

    var navigator: Navigator = Navigator()

    var getState: () -> State {
        return self.getAppState
    }

    init(dispatch: @escaping PromisableStoreDispatch, getAppState: @escaping () -> AppState) {
        self.promisableDispatch = dispatch
        self.getAppState = getAppState
    }
}

extension DependenciesContainer {
    convenience init(dispatch: @escaping PromisableStoreDispatch, getState: @escaping GetState) {
        let getAppState: () -> AppState = {
            guard let state = getState() as? AppState else {
                fatalError("Wrong State Type")
            }
            return state
        }

        self.init(dispatch: dispatch, getAppState: getAppState)
    }
}
