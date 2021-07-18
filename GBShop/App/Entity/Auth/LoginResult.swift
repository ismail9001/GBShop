//
//  LoginResult.swift
//  GBShop
//
//  Created by macbook on 22.06.2021.
//

struct LoginResult: Codable {
    let result: Int
    let errorMessage: String?
    let user: User?
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case errorMessage = "error_message"
        case user = "user"
    }
}
