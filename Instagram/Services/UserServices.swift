//
//  UserServices.swift
//  Instagram
//
//  Created by md imran on 24/6/23.
//

import Foundation
import Firebase


struct UserServices{
    static func fetchAllUser() async throws -> [User] {
        
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        
    }
}
