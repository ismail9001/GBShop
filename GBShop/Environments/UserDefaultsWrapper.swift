//
//  UserDefaultsWrapper.swift
//  GBShop
//
//  Created by macbook on 24.07.2021.
//

import Foundation

final class UserDefaultsWrapper {
    
    public static func saveUserInfo(user: User) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(user), forKey: "user")
    }
    
    public static func userInfo() -> User? {
        if let data = UserDefaults.standard.value(forKey: "user") as? Data {
            let user = try? PropertyListDecoder().decode(User.self, from: data)
            return user
        }
        return nil
    }
    
    public static func deleteUserData() {
        UserDefaults.standard.removeObject(forKey: "user")
    }
}
