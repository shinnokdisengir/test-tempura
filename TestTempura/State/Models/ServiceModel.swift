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

public enum Schema: String {
    case dev = "http://"
    case prod = "https://"
}

public enum URLs: String {
    case dev = "api-staging.feezup.com"
    case prod = "api.feezup.com"
}


// TODO: Da cambiare
let currentUrl = "\(Schema.prod.rawValue)\(URLs.prod.rawValue)"

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
    static func getURI(withApi api: Api) -> URLConvertible {
        return URL(string: currentUrl + api.rawValue)!
    }
    
    var auth: AuthServiceModel = AuthServiceModel()

}

