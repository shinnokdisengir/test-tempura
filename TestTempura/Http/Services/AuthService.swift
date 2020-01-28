//
//  AuthServiceModel.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Alamofire
import Foundation
import Hydra
import SwiftyJSON

extension Http {
    public static func login(withUsername username: String, andPassword password: String) -> Promise<Authentication> {
        return Promise<Authentication>(
            in: .background,
            { resolve, reject, _ in

                let params = [
                    "username": username,
                    "password": password,
                    "grant_type": "password",
                    "client_id": "1_27x48722ktus0ko4w8wg0w4o4s4cwok48s0c48woks4og88k0c",
                    "client_secret": "5yb6t1008m4gwwg8c80co0gcsg0k400ssockwwo0kc0c4ow8c"
                ]

                AF.request(Http.getURI(withApi: .login), method: .post, parameters: params)
                    .validate(contentType: ["application/json"])
                    .validate(statusCode: 200..<300)
                    .responseDecodable { (response: DataResponse<OAuth, AFError>) in
                        guard response.value != nil else {
                            debugPrint("🥶 Error on login: \(String(describing: response.error))")
                            let serviceError: HttpError = response.response != nil && response.response!.statusCode == 400 ?
                                HttpError.invalidAuthentication :
                                HttpError.generic(500, String(describing: response.error))
                            return reject(serviceError)
                        }
                        debugPrint("👍 Login success")
                        resolve(
                            Authentication(
                                accessToken: response.value!.access_token,
                                expiresIn: response.value!.expires_in,
                                tokenType: response.value!.token_type,
                                scope: response.value!.scope,
                                refreshToken: response.value!.refresh_token
                            )
                        )
                    }
            }
        )
    }
}
