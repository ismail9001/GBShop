//
//  User.swift
//  GBShop
//
//  Created by macbook on 22.06.2021.
//

struct User: Codable, Equatable {
    let userId: Int
    let login: String
    let password: String
    let name: String
    let lastname: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "id_user"
        case login = "user_login"
        case password = "user_password"
        case name = "user_name"
        case lastname = "user_lastname"
        case email = "email"
        case gender = "gender"
        case creditCard = "creditCard"
        case bio = "bio"
    }
}
