//
//  NetworkManager.swift
//  MySchdules
//
//  Created by RajayGoms on 6/23/25.
//

import Foundation

enum NetworkError: LocalizedError, Error {
    case invalidURL
    case decodingFailed
    case noData
    case unknown
    case custom(msg: String)
}
class NetworkManager {
    
    static func hitLoginRequest(from email: String, with password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        
        var parameter: LoginRequest = LoginRequest(username: email, password: password)
        let scheme = "https://"
        let host = "base url"
        let path = "/login"
        
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        
        guard let url = component.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.url = url
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        do {
            request.httpBody = try JSONEncoder().encode(parameter)
        } catch {
            completion(.failure(.unknown))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                completion(.failure(.noData))
                return
            }
            
            guard let datas = data else {
                completion(.failure(.decodingFailed))
                return
            }
            let decodedData = try? JSONDecoder().decode(LoginResponse.self, from: datas)
            if let response = decodedData {
                completion(.success(response))
            } else {
                completion(.failure(.custom(msg: "response failed.")))
            }
        }.resume()
    }
}
