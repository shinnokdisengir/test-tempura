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

enum LoginError: Error {
    case invalidAuthentication
    case generic
}

extension LoginError: RawRepresentable {
    init(rawValue: Int) {
        switch rawValue {
        case 400..<500:
            self = .invalidAuthentication
        default:
            self = .generic
        }
    }

    var rawValue: RawValue {
        switch self {
        case .invalidAuthentication: return 400
        default:
            return 500
        }
    }
}

enum RegistrationError: Error {
    case alreadyRegistered
    case passwordShort
    case generic
}

extension RegistrationError: RawRepresentable {
    init(rawValue: Int) {
        switch rawValue {
        case 409:
            self = .alreadyRegistered
        case 422:
            self = .passwordShort
        default:
            self = .generic
        }
    }

    var rawValue: RawValue {
        switch self {
        case .alreadyRegistered:
            return 409
        case .passwordShort:
            return 422
        default:
            return 500
        }
    }
}

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
                    "client_secret": "5yb6t1008m4gwwg8c80co0gcsg0k400ssockwwo0kc0c4ow8c",
                ]

                AF.request(Http.getURI(withApi: .login), method: .post, parameters: params)
                    .validate(contentType: ["application/json"])
                    .validate(statusCode: 200..<300)
                    .responseDecodable { (response: DataResponse<OAuth, AFError>) in
                        guard response.value != nil else {
                            debugPrint("🥶 Error on login: \(String(describing: response.error))")
                            guard response.response != nil else { return reject(LoginError.generic) }
                            return reject(LoginError(rawValue: response.response!.statusCode))
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

    public static func register(withEmail email: String, andPassword password: String) -> Promise<HttpResponse> {
        return Promise<HttpResponse>(
            in: .background,
            { resolve, reject, _ in

                let params = [
                    "email": email,
                    "password": password,
                ]

                AF.request(Http.getURI(withApi: .register), method: .post, parameters: params)
                    .validate(contentType: ["application/json"])
                    .validate(statusCode: 200..<300)
                    .responseDecodable { (response: DataResponse<HttpResponse, AFError>) in
                        debugPrint(response)
                        guard response.value != nil else {
                            debugPrint("🥶 Error registration: \(String(describing: response.error))")
                            guard response.response != nil else { return reject(RegistrationError.generic) }
                            return reject(RegistrationError(rawValue: response.response!.statusCode))
                        }
                        debugPrint("👍 Register success")
                        resolve(
                            HttpResponse(success: true)
                        )
                    }
            }
        )
    }
}
