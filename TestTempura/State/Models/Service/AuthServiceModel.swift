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

struct Authentication {
    let accessToken: String
    let expiresIn: Int
    let refreshToken: String
    let tokenType: String
}

// public func login(withUsername username: String?,
//                   andPassword password: String?,
//               andCompletion completion: @escaping (FEZError?) -> ()) {
//
//    let urlString = Constants.apiURL(withApi: Api.login.rawValue)
//
//    guard let url = URL(string: urlString) else {
//        completion(FEZError())
//        return
//    }
//
//    let params = oauthParams(withUsername: username, andPassword: password)
//
//    Alamofire.request(url, method: .post, parameters: params, headers: nil)
//        .validate(statusCode: 200..<400)
//        .responseDecodableObject(queue: .main, keyPath: nil, decoder: defaultDecoder) { (response: DataResponse<OauthResponse>) in
//
//            switch response.result {
//            case .success:
//                let credential = URLCredential(user: username ?? "", password: password ?? "", persistence: .permanent)
//                SessionService.sharedInstance.saveCredentials(credentials: credential)
//                SessionService.sharedInstance.saveOauth(oauthData: response.value)
//                NotificationService.sharedInstance.addSubscriptionObserver()
//
//                completion(nil)
//            case .failure(_):
//                completion(self.fezError(withResponse: response))
//            }
//    }
// }

struct AuthServiceModel {
    public func login(withUsername username: String, andPassword password: String) -> Promise<Authentication> {
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

                request(ServiceModel.getURI(withApi: .login), method: .post, parameters: params)
                    .validate(contentType: ["application/json"])
                    .validate(statusCode: 200..<400)
                    .responseJSON(
                        completionHandler: { response in
                            switch response.result {
                                case .success:
                                    let data = JSON(response.result.value!)
                                    resolve(
                                        Authentication(
                                            accessToken: data["access_token"].stringValue,
                                            expiresIn: data["expires_in"].intValue,
                                            refreshToken: data["refresh_token"].stringValue,
                                            tokenType: data["token_type"].stringValue))

                                case .failure:
                                    debugPrint(response.error as Any)
                                    reject(response.error!)
                            }
            })
        })
    }
}
