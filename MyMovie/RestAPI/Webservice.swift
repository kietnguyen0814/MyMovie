//
//  Webservice.swift
//  MyMovie
//
//  Created by Kiet Nguyen on 7/18/20.
//  Copyright © 2020 Kiet Nguyen. All rights reserved.
//

import UIKit
import Alamofire

enum DataResponseError: Error {
    case decoding
    var reason: String {
        switch self {
        case .decoding:
            return "An error occurred while decoding data"
        }
    }
}

protocol IWebservice {
    func getMethod<Model: Codable>(_ val: Model.Type,
                                   parameters: Parameters,
                                   Url:String, completion: @escaping (Result<Codable, Error>) -> Void)
}

final class Webservice: IWebservice {
    func getMethod<Model>(_ val: Model.Type, parameters: Parameters, Url: String, completion: @escaping (Result<Codable, Error>) -> Void) where Model : Decodable, Model : Encodable {
        AF.request(Url, method: .get, parameters: parameters, encoding: URLEncoding.queryString).validate(statusCode: 200..<300).responseJSON { (responseObject) in
            let status = responseObject.response?.statusCode ?? 0
            print("STATUS \(String(describing: status))")
            
            if (status >= 200 && status < 300) {
                if let data = responseObject.data {
                    guard let decodedResponse = try? JSONDecoder().decode(Model.self, from: data) else {
                        completion(Result.failure(DataResponseError.decoding))
                        return
                    }
                    completion(Result.success(decodedResponse))
                } else { //Success With No Data
//                    let json = ""
//                    let resDict = self.convertToDictionary(text: json)
//                    successBlock(resDict)
                }
            } else {
                let error = responseObject.error
                completion(Result.failure(error!))
            }
        }
    }
}
