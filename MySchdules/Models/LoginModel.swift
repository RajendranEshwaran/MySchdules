//
//  LoginModel.swift
//  MySchdules
//
//  Created by Rajendran Eshwaran on 6/23/25.
//

import Foundation

struct LoginRequest: Encodable {
    let username: String
    let password: String
}

struct LoginResponse: Decodable {
    let data: LoginResponseData
}

struct LoginResponseData: Decodable {
    let accessToken: String
    let refreshToken: String
}
