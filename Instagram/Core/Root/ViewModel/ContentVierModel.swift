//
//  ContentVierModel.swift
//  Instagram
//
//  Created by md imran on 23/6/23.
//

import Foundation
import FirebaseAuth
import Combine


@MainActor
class ContentViewModel: ObservableObject {
    
    private let service = AuthServices.shared
    private var cancelAble = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    
    init(){
        setupSubscriber()
    }
    
    func setupSubscriber(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancelAble)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancelAble)
    }
    
    
    
}
