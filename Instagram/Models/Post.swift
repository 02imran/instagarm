//
//  Post.swift
//  Instagram
//
//  Created by md imran on 10/6/23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    var likes: Int
    let caption: String
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POST: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, likes: 12, caption: "Iron Man", imageUrl: "batman", timeStamp: Date(), user: User.MOCK_USER[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, likes: 15, caption: "Batman", imageUrl: "batman", timeStamp: Date(), user: User.MOCK_USER[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, likes: 111, caption: "Venom", imageUrl: "batman", timeStamp: Date(), user: User.MOCK_USER[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, likes: 23, caption: "Spider man", imageUrl: "batman", timeStamp: Date(), user: User.MOCK_USER[3]),
        
    ]
}
