//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by macbook on 22.06.2021.
//

import Alamofire

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
