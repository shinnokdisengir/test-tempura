//
//  Common.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 28/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation

struct OAuth: Codable {
    let access_token: String
    let expires_in: Int
    let token_type: String
    let scope: String?
    let refresh_token: String

    enum CodingKeys: String, CodingKey {
        case access_token
        case expires_in
        case token_type
        case scope
        case refresh_token
    }
}

struct Authentication {
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    let scope: String?
    let refreshToken: String
}
