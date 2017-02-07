//
//  Api+Sample.swift
//  ApiSample
//
//  Created by nixnoughtnothing on 2/7/17.
//  Copyright © 2017 Sttir. All rights reserved.
//

public extension Api {
    typealias SampleModel = String
    
    // TODO: replace it with yours: path, method, responseType
    public func sampleRequest(params: [String: Any], callback: @escaping (Response<SampleModel>) -> Void) {
        ApiClient(path: "samplePath", method: .get, parameters: params).request(successBlock: { (json) in
            callback(.success("Success"))
        }) { (error) in
            print(error)
            callback(.failure(error))
        }
    }
}
