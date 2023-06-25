//
//  SearchViewModel.swift
//  Instagram
//
//  Created by md imran on 25/6/23.
//

import Foundation


class SearchViewModel: ObservableObject {
    
    @Published var user = [User]()
    
    init () {
        Task { try await fetchAllUser() }
    }
    
    @MainActor
    func fetchAllUser() async throws {
        self.user  = try await UserServices.fetchAllUser()
    }
}
