//
//  UserActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 28/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana
import Hydra

struct UserMe: StateUpdater {
    var username: String
    var password: String

    func updateState(_ currentState: inout AppState) {
        do {
            // TODO: - Aggiungere lo spinner di caricamento
            let response = try await(currentState.service.auth.login(withUsername: self.username, andPassword: self.password))
            currentState.session.username = username
            currentState.session.authentication = response
            currentState.session.logged = true
        } catch ServiceError.invalidAuthentication  {
            debugPrint("invalidAuthentication")
            currentState.session.logged = false
        } catch ServiceError.generic(let code, let message) {
            debugPrint(code, message as Any)
            currentState.session.logged = false
        } catch {
            debugPrint("BOH error")
            currentState.session.logged = false
        }
    }
}

//
//public func getUser(completion: @escaping (FEZError?, User?) -> ()) {
//
//    let urlString = Constants.apiURL(withApi: Api.me.rawValue)
//
//    guard let url = URL(string: urlString) else {
//        completion(FEZError(), nil)
//        return
//    }
//
//    Alamofire.request(url, method: .get, parameters: nil, headers: self.oauthHeader())
//        .validate(statusCode: 200..<400)
//        .responseDecodableObject(queue: .main, keyPath: "user", decoder: defaultDecoder) { (response: DataResponse<User>) in
//
//            switch response.result {
//            case .success:
//                completion(nil, response.value)
//            case .failure(_):
//                completion(self.fezError(withResponse: response), nil)
//            }
//    }
//}
