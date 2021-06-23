//
//  ErrorParser.swift
//  GBShop
//
//  Created by macbook on 22.06.2021.
//

import Alamofire

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
