//
//  UIModel.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 28/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation

struct UIModel: Equatable {
    var loading: Bool = false
    
    static func == (l: UIModel, r: UIModel) -> Bool {
        return l.loading == r.loading
    }
}

