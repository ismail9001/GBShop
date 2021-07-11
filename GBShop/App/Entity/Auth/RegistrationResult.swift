//
//  RegistrationResult.swift
//  GBShop
//
//  Created by macbook on 23.06.2021.
//

struct RegistrationResult: Codable {
    let result: Int
    let userMessage: String

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case userMessage = "user_message"
    }
}
