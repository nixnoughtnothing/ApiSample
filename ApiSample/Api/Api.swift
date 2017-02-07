//
//  Api.swift
//  ApiSample
//
//  Created by nixnoughtnothing on 2/7/17.
//  Copyright © 2017 Sttir. All rights reserved.
//

import Alamofire
import SwiftyJSON

// INFO: Singleton
public final class Api {
    private init() { }
    public static let shared: Api = Api()
}

public enum Response<T> {
    case success(T)
    case failure(Error)
}

// MARK: - Inner
// TODO: replace it with yours
private let host = "https://example.com"

internal struct ApiClient {
    let url: String
    let method: HTTPMethod
    let parameters: Parameters
    
    internal init(path: String, method: HTTPMethod = .get, parameters: Parameters = [:]) {
        self.url = host + path
        self.method = method
        self.parameters = parameters
    }
    
    internal func request(successBlock: @escaping (_ data: JSON?) -> Void, errorBlock: @escaping (_ error: Error) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result {
                case .success(let data):
                    guard let data = data as? Data else { return }
                    successBlock(JSON(data: data))
                case .failure(let error):
                    errorBlock(error)
                }
        }
    }
}
