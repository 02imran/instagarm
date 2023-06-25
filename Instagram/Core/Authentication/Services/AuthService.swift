//
//  AuthService.swift
//  Instagram
//
//  Created by md imran on 23/6/23.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthServices {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthServices()
    init() {
        Task { try await loadUserData() }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("login \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, passwrod: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: passwrod)
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, email: email, userName: userName)
            
        } catch {
            print("error \(error.localizedDescription)")
        }

    }
    
    @MainActor
    func loadUserData()async throws{
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        self.currentUser = try snapshot.data(as: User.self)
    }
    
    func logOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, email: String, userName: String) async {
        let user = User(id: uid, userName: userName, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
