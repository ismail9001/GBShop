//
//  UserUpdateRequestFactory.swift
//  GBShop
//
//  Created by macbook on 23.06.2021.
//

import Alamofire

protocol UserUpdateRequestFactory {
    func updateUser(userId: Int,
                    username: String,
                    password: String,
                    email: String,
                    gender: String,
                    creditCard: String,
                    bio: String,
                    completionHandler: @escaping (AFDataResponse<UserUpdateResult>) -> Void)
}
