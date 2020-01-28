//
//  UserActions.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 28/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Katana
import Hydra

//public func oauthHeader() ->HTTPHeaders {
//    var headers: HTTPHeaders = [:]
//    let oauth = SessionService.sharedInstance.currentOauth()
//    if let token = oauth?.access_token {
//        headers["Authorization"] = "Bearer \(token)"
//    }
//    //        guard let data = oauth?.access_token?.data(using: .utf8) else { return headers}
//
//    //        let token = data.base64EncodedString(options: [])
//
//    return headers
//}


struct UserMe: StateUpdater {
    
    func updateState(_ currentState: inout AppState) {
        
//        do {
//            // TODO: - Aggiungere lo spinner di caricamento
//            let response = try await(currentState.service.auth.login(withUsername: self.username, andPassword: self.password))
//            currentState.session.username = username
//            currentState.session.authentication = response
//            currentState.session.logged = true
//        } catch ServiceError.invalidAuthentication  {
//            debugPrint("invalidAuthentication")
//            currentState.session.logged = false
//        } catch ServiceError.generic(let code, let message) {
//            debugPrint(code, message as Any)
//            currentState.session.logged = false
//        } catch {
//            debugPrint("BOH error")
//            currentState.session.logged = false
//        }
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
