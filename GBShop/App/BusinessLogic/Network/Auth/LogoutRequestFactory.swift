//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by macbook on 23.06.2021.
//

import Alamofire

protocol LogoutRequestFactory {
    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
