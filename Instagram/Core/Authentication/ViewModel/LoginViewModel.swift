//
//  LoginViewModel.swift
//  Instagram
//
//  Created by md imran on 24/6/23.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() async throws {
        try await AuthServices.shared.login(withEmail: email, password: password)
    }
}
