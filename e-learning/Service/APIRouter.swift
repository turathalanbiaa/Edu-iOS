//
//  APIRouter.swift
//  e-learning
//
//  Created by hussein abed on 2/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case credentials(email:String, password:String)
    case users
    case user(id: Int)
    case countries(language: String)
    case certificate(language: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .credentials:
            return .post
        case .users, .user:
            return .get
        case .countries:
            return .post
        case .certificate:
            return .post
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .credentials:
            return "/credentials"
        case .users:
            return "/users"
        case .user(let id):
            return "/user/\(id)"
        case .countries:
            return "/get-countries"
        case .certificate:
            return "/get-certificates"
        }
        
    }
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .credentials(let email, let password):
            return [APIParameterKey.login: email, APIParameterKey.password: password]
        case .users, .user:
            return nil
        case .countries(let language):
            return [APIParameterKey.language: language]
        case .certificate(let language):
            return [APIParameterKey.language: language]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.app_key.rawValue, forHTTPHeaderField: HTTPHeaderField.app_key.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
}
