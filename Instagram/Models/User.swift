//
//  User.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import Foundation
import Firebase


struct User: Identifiable, Codable, Hashable {
    let id: String
    var userName: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var currentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}


extension User {
    static var MOCK_USER:[User] = [
        .init(id: NSUUID().uuidString, userName: "Batman", profileImageUrl: "batman", fullName: "Bruce wayne", bio: "Batman is savior of goatam city", email: "batman@gamil.com"),
        .init(id: NSUUID().uuidString, userName: "Spider", profileImageUrl: "batman", fullName: "Perter Parker", bio: "Batman is savior of goatam city", email: "batman@gamil.com"),
        .init(id: NSUUID().uuidString, userName: "Venom", profileImageUrl: "batman", fullName: nil, bio: "Batman is savior of goatam city", email: "batman@gamil.com"),
        .init(id: NSUUID().uuidString, userName: "Ironman", profileImageUrl: "batman", fullName: "Bruce wayne", bio: "Batman is savior of goatam city", email: "batman@gamil.com")

    ]
}
