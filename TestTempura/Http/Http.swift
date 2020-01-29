//
//  ServiceModel.swift
//  TestTempura
//
//  Created by Gabriele Ghio on 27/01/2020.
//  Copyright © 2020 Occhidelfato. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

public enum Schema: String {
    case dev = "http://"
    case prod = "https://"
}

public enum URLs: String {
    case dev = "api-staging.feezup.com"
    case prod = "api.feezup.com"
}

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

/// / Generic response from http services
struct HttpResponse: Codable {
    var success: Bool?

    enum CodingKeys: String, CodingKey {
        case success
    }
}

struct Http {
    static func getURI(withApi api: Api) -> URLConvertible {
        var url = "\(Schema.prod.rawValue)\(URLs.prod.rawValue)"
        let env = ProcessInfo.processInfo.environment["ENV"]
        if env != nil, env! == "debug" {
            url = "\(Schema.dev.rawValue)\(URLs.dev.rawValue)"
        }
        debugPrint("API-URL: ", url)
        return URL(string: url + api.rawValue)!
    }
}
