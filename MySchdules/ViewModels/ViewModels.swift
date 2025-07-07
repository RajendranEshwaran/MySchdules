//
//  ViewModels.swift
//  MySchdules
//
//  Created by Rajendran Eshwaran on 6/23/25.
//

import Foundation
import SwiftUI

class ViewModels: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var error: NetworkError?
    @Published var isAuthenticated: Bool = false
    @Published var schuleHeader = SchduleHeaderModel(title: "My Scdule", dateAndDay: "Saturday, 23 June")
    
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
