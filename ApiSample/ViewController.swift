//
//  ViewController.swift
//  ApiSample
//
//  Created by nixnoughtnothing on 2/7/17.
//  Copyright © 2017 Sttir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // INFO: Api Request
        // TODO: replace it with yours: params
        Api.shared.sampleRequest(params: ["sampleKey": "sampleValue"]) { (response) in
            switch response {
            case .success(let data):
                print("Success: \(data)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

