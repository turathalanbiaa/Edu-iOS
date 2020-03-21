//
//  Constant.swift
//  e-learning
//
//  Created by hussein abed on 2/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct ProductionServer {
    static let baseURL = "http://192.168.1.155:8000/api"
}

struct APIParameterKey {
    static let password = "password"
    static let login = "login"
    static let language = "lang"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case app_key = "APP_KEY"
}

enum ContentType: String {
    case json = "multipart/form-data"
    case app_key = "base64:uIAU3rjxggwrXzNlODqes2bOi9N30U5SyttvABBRE4I="
    case accept = "application/json"
}
