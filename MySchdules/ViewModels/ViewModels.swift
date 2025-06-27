//
//  ViewModels.swift
//  MySchdules
//
//  Created by Rajendran Eshwaran on 6/23/25.
//

import Foundation

class ViewModels {
    @Published var isLoading: Bool = false
    @Published var error: NetworkError?
    @Published var isAuthenticated: Bool = false
    func attemptLogin(email: String, password: String) {
        NetworkManager.hitLoginRequest(from: email, with: password, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.isAuthenticated = true
            case .failure(let error):
                self.error = error
            }
        })
    }
}
