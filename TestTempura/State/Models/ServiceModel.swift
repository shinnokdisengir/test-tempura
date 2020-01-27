//
//  ServiceModel.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

//
//    public struct Url {
//        static let Dev = "http://api-staging.feezup.com"
//        static let Prod = "http://api.feezup.com"
//    }
//
//    public struct Schema {
//        static let Dev = "http"
//        static let Prod = "http"
//    }
//
//    public static func baseURL() -> String {
//        return Url.Prod
//    }
//
//    public static func apiURL(withApi api: String) -> String {
//        return baseURL() + api
//    }

public enum Schema: String {
    case dev = "http://"
    case prod = "https://"
}

public enum URLs: String {
    case dev = "api-staging.feezup.com"
    case prod = "api.feezup.com"
}


// TODO: Da cambiare
let currentUrl = "\(Schema.dev.rawValue)\(URLs.dev.rawValue)"

public enum Api: String {
    case register = "/register"
    case login = "/oauth/v2/token"
    case reset = "/resetting/request"
    case me = "/me/"
    case token = "/me/token"
    case categories = "/category"
    case offer = "/offer/"
    case offersSearch = "/offer/search"
    case offersSponsorship = "/offer/sponsorship"
    case offersLike = "/like/offer/"
    case place = "/place/"
    case placeSearch = "/place/search"
    case placeLike = "/like/place/"
    case offersPreferred = "/like/offers"
}


struct ServiceModel {
    
//    var defaultDecoder: Decoder {
//        let decoder = JSONDecoder()
//        decoder.dataDecodingStrategy = .iso8601
//        return decoder
//    }
//
//
//    public func oauthHeader() ->HTTPHeaders {
//        var headers: HTTPHeaders = [:]
//        let oauth = SessionService.sharedInstance.currentOauth()
//        if let token = oauth?.access_token {
//            headers["Authorization"] = "Bearer \(token)"
//        }
//        //        guard let data = oauth?.access_token?.data(using: .utf8) else { return headers}
//
//        //        let token = data.base64EncodedString(options: [])
//
//        return headers
//    }
//
    //    open class func authorizationHeader(user: String, password: String) -> (key: String, value: String)? {
    //        guard let data = "\(user):\(password)".data(using: .utf8) else { return nil }
    //
    //        let credential = data.base64EncodedString(options: [])
    //
    //        return (key: "Authorization", value: "Basic \(credential)")
    //    }
    
    //    public func autenticationHeader(withUsername username: String?, andPassword password: String?) -> HTTPHeaders {
    //
    //        var headers: HTTPHeaders = [:]
    //
    //        var user: String = ""
    //        var passwd: String = ""
    //
    //        if let u = username, let p = password {
    //            user = u
    //            passwd = p
    //        } else {
    //            if let credential = SessionService.sharedInstance.currentCredentials() {
    //
    //                user = credential.user ?? ""
    //                passwd = credential.password ?? ""
    //            }
    //        }
    //
    //        if let authorizationHeader = Request.authorizationHeader(user: user, password: passwd) {
    //            headers[authorizationHeader.key] = authorizationHeader.value
    //        }
    //
    //        return headers
    //    }
    
    static func getURI(withApi api: Api) -> URLConvertible {
        return URL(string: currentUrl + api.rawValue)!
    }
    
    var auth: AuthServiceModel = AuthServiceModel()

}

