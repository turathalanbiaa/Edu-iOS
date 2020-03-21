//
//  APIHandler.swift
//  e-learning
//
//  Created by hussein abed on 2/12/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Alamofire

class APIHandler {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (AFResult<T>)->Void) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder){ (response: AFDataResponse<T>) in
            completion(response.result)
        }
    }
    
    static func login(email: String, password: String, completion: @escaping (AFResult<Root<User>>)->Void) {
        performRequest(route: APIRouter.credentials(email: email, password: password), completion: completion)
    }
    
    static func countries(language: String, completion: @escaping (AFResult<Root<[Country]>>)->Void) {
        performRequest(route: APIRouter.countries(language: language), completion: completion)
    }
    
    static func certificates(language: String, completion:@escaping (AFResult<Root<[Certificate]>>)->Void) {
        performRequest(route: APIRouter.certificate(language: language), completion: completion)
    }
    
    static func uploadImage(imageData: Data) {
        let param = ["id": 20, "type": 1]
        AF.upload(multipartFormData: {(formData) in
            for(key, value) in param {
                           formData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                       }
            formData.append(imageData, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
           
        }, to: "https://leta.turathalanbiaa.com/api/image-store", headers: [HTTPHeaderField.acceptType.rawValue: ContentType.accept.rawValue,
                                                                            HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue,
                                                                            HTTPHeaderField.app_key.rawValue: ContentType.app_key.rawValue]).uploadProgress { progress in
                                                                                print("Upload Progress: \(progress.fractionCompleted)")
                                                                            }.responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure:
                print("failure")
            }
        }
    }
}
