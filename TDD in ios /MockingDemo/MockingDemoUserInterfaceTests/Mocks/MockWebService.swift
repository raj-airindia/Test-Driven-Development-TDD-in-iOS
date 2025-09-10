//
//  MockWebService.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Raj Mahajan on 28/08/24.
//

import Foundation

class MockWebService: NetworkService {
    
    func login(username: String, password: String, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        
        if username == "JohnDoe" && password == "Password" {
            completion(.success(()))
        } else {
            completion(.failure(.notAuthenticated))
        }
    }
}
