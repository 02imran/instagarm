//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by md imran on 23/6/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() async throws{
        try await AuthServices.shared.createUser(email: email, passwrod: password, userName: userName)
        
        email = ""
        password = ""
        userName = ""
    }
}
