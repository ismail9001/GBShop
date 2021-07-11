//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by macbook on 23.06.2021.
//

import Alamofire

protocol RegistrationRequestFactory {
    func register(userId: Int,
                  username: String,
                  password: String,
                  email: String,
                  gender: String,
                  creditCard: String,
                  bio: String,
                  completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void)
}
