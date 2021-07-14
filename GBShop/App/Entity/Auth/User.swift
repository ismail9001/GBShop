//
//  User.swift
//  GBShop
//
//  Created by macbook on 22.06.2021.
//

struct User: Codable, Equatable {
    let userId: Int
    let login: String
    let name: String
    let lastname: String

    enum CodingKeys: String, CodingKey {
        case userId = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
