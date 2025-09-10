//
//  NetworkServiceFactory.swift
//  MockingDemo
//
//  Created by Raj Mahajan on 28/08/24.
//

import Foundation

class NetworkServiceFactory {
    
    static func create() -> NetworkService {
        
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment {
            if environment == "TEST" {
                return MockWebService()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}
